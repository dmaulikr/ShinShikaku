//
//  SpecHelper.swift
//  ShinShikakuTests
//
//  Created by Matthew Buckley on 7/21/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation
@testable import ShinShikaku

class TestableTimeService: TimeService {

    init(withOffset offset: Int) {
        self.offset = offset
    }

    private var offset: Int

    override var currentTime: Date {
        return Calendar
            .current
            .date(byAdding: .hour,
                  value: offset,
                  to: Date(),
                  wrappingComponents: false) ?? Date()
    }


}
