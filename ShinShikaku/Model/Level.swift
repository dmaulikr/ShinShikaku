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

    init(winConditions: [WinCondition]) {
        self.winConditions = winConditions
    }

}
