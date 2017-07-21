//
//  TimeService.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/21/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation

class TimeService {

    static var sharedInstance = TimeService()

    var currentTime: Date {
        return Date()
    }

}
