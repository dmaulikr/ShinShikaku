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

    /// Backing collection of "Tiles"
    private (set) var tiles: [Tile] = []

    init(arrayLiteral elements: Tile...) {
        self.tiles = elements
    }

    /// Initializer (fileprivate, API is exposed through GridGenerator)
    ///
    /// - Parameter tiles: "Tiles" for backing collection
    fileprivate init(tiles: [Tile]) { self.tiles = tiles }
}

struct GridGenerator {

    /// Generates a Grid
    ///
    /// - Parameters:
    ///   - generator: a function that takes a Position and returns a TileState
    ///   - width: width of the grid (column count)
    ///   - height: height of the grid (row count)
    /// - Returns: a Grid
    static func generateBoard(with generator: (Position) -> TileState,
                              width: Int, height: Int) -> Grid {
        var tiles = [Tile]()
        let baseRange = 0..<height
        for col in 0..<width {
            let rows = baseRange
            for row in rows {
                let position = Position(x: col, y: row )
                tiles.append(Tile(position: position, state: generator(position)))
            }
        }
        return Grid(tiles: tiles)
    }

}
