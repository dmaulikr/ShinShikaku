//
//  StartScreenSpec.swift
//  ShinShikakuTests
//
//  Created by Matthew Buckley on 7/17/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Quick
import Nimble

@testable import ShinShikaku

class StartScreenSpec: QuickSpec {

    var startMenuVC: StartMenuViewController!

    override func spec() {
        beforeEach {
            self.startMenuVC = StartMenuViewController()
        }

        describe("Protocol implementations") {

            it("Implements ViewConfigurable") {
                expect(self.startMenuVC as ViewConfigurable).toNot(beNil())
            }

        }

        describe("the view") {
            beforeEach {
                // Method #2: Triggers .viewDidLoad(), .viewWillAppear(), and .viewDidAppear() events.
                self.startMenuVC.beginAppearanceTransition(true, animated: false)
                self.startMenuVC.endAppearanceTransition()
            }
        }


        describe("Lifecycle") {

            describe(".viewDidLoad") {
                beforeEach {
                    let _ =  self.startMenuVC.view
                    self.startMenuVC.beginAppearanceTransition(true, animated: false)
                    self.startMenuVC.endAppearanceTransition()
                }

                describe("ExpandingHamburgerView") {
                    it("StartMenuViewController's subviews must include an ExpandingHamburgerView") {
                        expect(self.startMenuVC.view.subviews.filter({
                            v in v is ExpandingHamburgerView
                        }).count).to(equal(1))
                    }
                }

                describe("'resume' button") {

                    it("StartMenuViewController's subviews must include a 'resume' button") {
                        expect(self.startMenuVC.view.subviews.filter({
                            v in v is UIButton
                        }).count).to(equal(1))
                    }

                }

                describe("view") {

                    afterEach {
                        TimeService.sharedInstance = TimeService()
                    }

                    it("background color must be .dark if current local time is between 19:00 and 07:00") {
                        if (!TimeService.sharedInstance.currentTime.isNightTime) {
                            self.resetScreen()
                        }
                        expect(self.startMenuVC.view.backgroundColor).to(equal(UIColor(named: UIColor.Name.BackgroundDark)))
                    }

                    it("background color must be .light if current local time is between 07:00 and 19:00") {
                        if (TimeService.sharedInstance.currentTime.isNightTime) {
                            self.resetScreen()
                        }
                        expect(self.startMenuVC.view.backgroundColor).to(equal(UIColor(named: UIColor.Name.BackgroundLight)))
                    }

                }
            }

        }

    }
}

private extension StartScreenSpec {

    func resetScreen() {
        TimeService.sharedInstance = TestableTimeService(withOffset: 12)
        startMenuVC = StartMenuViewController()
    }

}
