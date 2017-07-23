//
//  ExpandingHamburgerViewSpec.swift
//  ShinShikakuTests
//
//  Created by Matthew Buckley on 7/20/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import ShinShikaku

class ExpandingHamburgerViewSpec: QuickSpec {

    override func spec() {
        describe("ExpandingHamburgerView") {

            let view = ExpandingHamburgerView(frame: .zero)

            it("must implement ViewConfigurable") {
                expect(view as ViewConfigurable).toNot(beNil())
            }

            it("must have exactly 3 NavPushButtons") {
                expect(view.subviews.filter({ $0 is NavPushButton }).count).to(equal(3))
            }

            it("must have exactly 4 UIButtons total") {
                expect(view.subviews.count).to(equal(4))
            }

            it("must have only UIButton subviews") {
                expect(view.subviews.filter({ !($0 is UIButton) }).count).to(equal(0))
            }

        }
    }

}
