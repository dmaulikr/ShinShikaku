//
//  Position.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/24/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation

struct Position {
    var x: Int
    var y: Int
    static var zero = Position(x: 0, y: 0)
}

// MARK: - Custom String Convertible

extension Position: CustomStringConvertible {

    var description: String {
        return "(\(x), \(y))"
    }

}

// MARK: - Equatable

extension Position: Equatable {}

func == (lhs: Position, rhs: Position) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}
