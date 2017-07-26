//
//  LevelViewModel.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/23/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation

struct LevelViewModel {

    var level: Level

    /// Generate a state (traversable/blocked) for a given Position
    ///
    /// - Parameter position: a Position
    /// - Returns: a TileState
    static func generateTileState(for position: Position) -> TileState {
        return .traversable
    }
    
}
