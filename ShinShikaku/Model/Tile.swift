//
//  Tile.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/24/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation

struct Tile {

    let position: Position
    let state: TileState

}

enum TileState {

    case traversable, blocked

    var isTraversable: Bool {
        switch self {
        case .traversable:
            return true
        default:
            return false
        }
    }

}
