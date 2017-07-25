//
//  Level.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/24/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation

struct Level {

    let winConditions: [WinCondition]
    let grid: Grid

    init(winConditions: [WinCondition], grid: Grid) throws {
        if grid.area != winConditions.reduce(0, { $0 + $1.dimensions.area }) {
            throw ShikakuError.Grid.winConditionGridAreaMismatch
        }
        self.grid = grid
        self.winConditions = winConditions
    }

}
