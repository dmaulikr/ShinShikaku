//
//  LevelSpec.swift
//  ShinShikakuTests
//
//  Created by Matthew Buckley on 7/24/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ShinShikaku

class LevelSpec: QuickSpec {

    let level = Level(winConditions: [])

    override func spec() {

        describe("Properties") {

            it("Level has WinConditions") {
                expect(self.level.winConditions).toNot(beNil())
            }

        }

    }

}
