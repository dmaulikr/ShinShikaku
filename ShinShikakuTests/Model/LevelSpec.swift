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

    var level: Level!

    override func spec() {

        beforeEach {
            let tiles = [Tile(), Tile()]
            let winConditions = [WinCondition(position: Position.zero, dimensions: Dimensions(width: 2, height: 1))]
            self.level = try! Level(winConditions: winConditions, grid: Grid(tiles: tiles))
        }

        describe("Properties") {

            it("Level must have WinConditions") {
                expect(self.level.winConditions).toNot(beNil())
            }

            it("Level must have a Grid") {
                expect(self.level.grid).toNot(beNil())
            }

            it("Area of the level's grid must be equal to the area of the combined area of the level's winconditions") {
                expect(self.level.grid.area == self.level.winConditions.reduce(0, { $0 + $1.dimensions.area })).to(beTrue())
            }

            it("Level must have a grid of nonzero area") {
                expect(self.level.grid.area == 0).to(beFalse())
            }

        }

    }

}
