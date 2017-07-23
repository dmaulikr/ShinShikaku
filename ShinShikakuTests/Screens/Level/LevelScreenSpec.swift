//
//  LevelScreenSpec.swift
//  ShinShikakuTests
//
//  Created by Matthew Buckley on 7/22/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Quick
import Nimble
@testable import ShinShikaku

class LevelScreenSpec: QuickSpec {

    var levelVC: LevelViewController!

    override func spec() {

        beforeEach {
            self.levelVC = LevelViewController()
        }

        describe("Protocol implementations") {

            it("Implements ViewConfigurable") {
                expect(self.levelVC as ViewConfigurable).toNot(beNil())
            }

        }

        describe("UI") {
            beforeEach {
                let window = UIWindow(frame: UIScreen.main.bounds)
                window.rootViewController = self.levelVC
                window.makeKeyAndVisible()
                let _ =  self.levelVC.view
                self.levelVC.beginAppearanceTransition(true, animated: false)
                self.levelVC.endAppearanceTransition()
            }

            afterEach {
                TimeService.sharedInstance = TimeService()
            }

            it("background color must be .dark if current local time is between 19:00 and 07:00") {
                if (!TimeService.sharedInstance.currentTime.isNightTime) {
                    self.resetScreen()
                }
                expect(self.levelVC.view.backgroundColor).to(equal(UIColor(named: UIColor.Name.BackgroundDark)))
            }

            it("background color must be .light if current local time is between 07:00 and 19:00") {
                if (TimeService.sharedInstance.currentTime.isNightTime) {
                    self.resetScreen()
                }
                expect(self.levelVC.view.backgroundColor).to(equal(UIColor(named: UIColor.Name.BackgroundLight)))
            }
        }

    }

}

private extension LevelScreenSpec {

    func resetScreen() {
        TimeService.sharedInstance = TestableTimeService(withOffset: 12)
        levelVC = LevelViewController()
    }

}
