//
//  Session.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/20/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class Session {

    /// Singleton instance
    static let sharedInstance = Session()

    /// Global color theme.
    var theme: Theme {
        return TimeService.sharedInstance.currentTime.isNightTime ? .dark : .light
    }

}

extension Date {

    /// Returns 'true' for 7pm-7am, false otherwise
    var isNightTime: Bool {
        return self >= timeAt(hour: 19) || self <= timeAt(hour: 7) ? true : false
    }

    /// Computes a new date
    ///
    /// - Parameter hour: hour offset
    /// - Returns: a new Date
    private func timeAt(hour: Int) -> Date {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!

        var date_components = calendar.components(
            [NSCalendar.Unit.year,
             NSCalendar.Unit.month,
             NSCalendar.Unit.day],
            from: self)

        date_components.hour = hour

        let newDate = calendar.date(from: date_components)!
        return newDate
    }
}
