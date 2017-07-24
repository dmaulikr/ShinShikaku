//
//  WinCondition.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/24/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation

struct WinCondition {

    /// The origin coordinate of the condition
    var position: Position

    /// The dimensions of the condition (width, height)
    var dimensions: Dimensions
}

extension WinCondition: Equatable {}

func == (lhs: WinCondition, rhs: WinCondition) -> Bool {
    return lhs.position.x == rhs.position.x &&
    rhs.position.y == rhs.position.y &&
    lhs.dimensions == rhs.dimensions
}

