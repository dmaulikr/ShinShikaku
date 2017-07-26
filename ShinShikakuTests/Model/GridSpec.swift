//
//  GridSpec.swift
//  ShinShikakuTests
//
//  Created by Matthew Buckley on 7/24/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ShinShikaku

class GridSpec: QuickSpec {

    let grid = GridGenerator.generateBoard(with: LevelViewModel.generateTileState(for:), width: 5, height: 5)

    override func spec() {

        describe("Requirements") {
            it("no 2 tiles in a grid can have the same Position") {
                self.grid.tiles.forEach({ tile in
                    expect(self.grid.tiles.filter({ $0.position == tile.position }).count).to(equal(1))
                })
            }
        }

    }

}
