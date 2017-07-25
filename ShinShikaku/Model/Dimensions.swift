//
//  Dimensions.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/24/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation

struct Dimensions {
    var width: Int
    var height: Int
    var area: Int { return width * height }
    static var zero = Dimensions(width: 0, height: 0)
}

extension Dimensions: Equatable {}

func == (lhs: Dimensions, rhs: Dimensions) -> Bool {
    return lhs.width == rhs.width
        && lhs.height == rhs.height
}
