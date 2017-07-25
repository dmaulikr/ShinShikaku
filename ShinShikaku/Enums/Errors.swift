//
//  Errors.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/25/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation

enum ShikakuError: Error {

    enum Grid: Error {
        case winConditionGridAreaMismatch
    }

}
