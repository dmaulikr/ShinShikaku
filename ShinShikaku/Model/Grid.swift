//
//  Grid.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/24/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation

struct Grid: ExpressibleByArrayLiteral {

    var area: Int { return tiles.count }

    private var tiles: [Tile] = []

    init(arrayLiteral elements: Tile...) {
        self.tiles = elements
    }

    init(tiles: [Tile]) { self.tiles = tiles }
}
