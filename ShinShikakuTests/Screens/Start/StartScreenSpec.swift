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
                    let window = UIWindow(frame: UIScreen.main.bounds)
                    window.rootViewController = self.startMenuVC
                    window.makeKeyAndVisible()
                    let _ =  self.startMenuVC.view
                    self.startMenuVC.beginAppearanceTransition(true, animated: false)
                    self.startMenuVC.endAppearanceTransition()
                }

                afterEach {
                    TimeService.sharedInstance = TimeService()
                }

                it("StartMenuViewController's subviews must include an ExpandingHamburgerView") {
                    expect(self.startMenuVC.view.subviews.filter({
                        v in v is ExpandingHamburgerView
                    }).count).to(equal(1))
                }

                it("StartMenuViewController's subviews must include a 'resume' button") {
                    expect(self.startMenuVC.view.subviews.filter({
                        v in v is UIButton
                    }).count).to(equal(1))
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

                describe("button navigation") {

                    it("settings button must present SettingsViewController") {
                        let button = self.startMenuVC.expandingHamburgerView.settingsButton
                        button.sendActions(for: .touchUpInside)

                        expect(self.startMenuVC.presentedViewController).to(beAnInstanceOf(SettingsViewController))
                    }

                    it("profile button must present ProfileViewController") {
                        let button = self.startMenuVC.expandingHamburgerView.profileButton
                        button.sendActions(for: .touchUpInside)

                        expect(self.startMenuVC.presentedViewController).toEventually(beAnInstanceOf(ProfileViewController.self))
                    }

                    it("credits button must present CreditsViewController") {
                        let button = self.startMenuVC.expandingHamburgerView.creditsButton
                        button.sendActions(for: .touchUpInside)

                        expect(self.startMenuVC.presentedViewController).to(beAnInstanceOf(CreditsViewController))
                    }

                    it("resume button must present LevelViewController") {
                        let button = self.startMenuVC.resumeButton
                        button.sendActions(for: .touchUpInside)

                        expect(self.startMenuVC.presentedViewController).to(beAnInstanceOf(LevelViewController))
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
