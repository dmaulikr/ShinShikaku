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
}

extension Dimensions: Equatable {}

func == (lhs: Dimensions, rhs: Dimensions) -> Bool {
    return lhs.width == rhs.width
        && lhs.height == rhs.height
}
