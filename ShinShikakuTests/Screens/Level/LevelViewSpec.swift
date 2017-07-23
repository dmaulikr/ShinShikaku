//
//  LevelViewSpec.swift
//  ShinShikakuTests
//
//  Created by Matthew Buckley on 7/23/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ShinShikaku

class LevelViewSpec: QuickSpec {

    override func spec() {

        describe("LevelView") {

            let view = LevelView(frame: .zero)

            it("must implement ViewConfigurable") {
                expect(view as ViewConfigurable).toNot(beNil())
            }

            it("Must contain exactly 1 GridView subview") {
                expect(view.subviews.filter({ $0 is GridView }).count).to(equal(1))
            }
        }
    }

}
