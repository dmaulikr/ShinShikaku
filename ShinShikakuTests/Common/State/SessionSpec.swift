//
//  SessionSpec.swift
//  ShinShikakuTests
//
//  Created by Matthew Buckley on 7/20/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ShinShikaku

class SessionSpec: QuickSpec {

    override func spec() {
        describe("session has a Theme") {
            it("must have a theme") {
                expect(Session.sharedInstance.theme).toNot(beNil())
            }
        }

    }

}
