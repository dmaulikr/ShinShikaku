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
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.rootViewController = self.levelVC
            window.makeKeyAndVisible()
            let _ =  self.levelVC.view
            self.levelVC.beginAppearanceTransition(true, animated: false)
            self.levelVC.endAppearanceTransition()
        }

        describe("Protocol implementations") {

            it("Implements ViewConfigurable") {
                expect(self.levelVC as ViewConfigurable).toNot(beNil())
            }

            it("Implements LevelViewType") {
                self.isAssocated(t: self.levelVC)
            }

        }

        describe("UI") {

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

        describe("View") {
            it("has a LevelView") {
                expect(self.levelVC.view.subviews.filter({ $0 is LevelView }).count).to(equal(1))
            }
        }

        describe("View Model") {
            it("has a LevelViewModel") {
                expect(self.levelVC.viewModel is LevelViewModel).to(beTrue())
            }
        }

    }

}

private extension LevelScreenSpec {

    func resetScreen() {
        TimeService.sharedInstance = TestableTimeService(withOffset: 12)
        levelVC = LevelViewController()
    }

    func isLevelViewType<T>(t: T) where T: LevelViewType {
        return
    }

}
