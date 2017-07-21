//
//  Theme.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/20/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import UIKit
import RxSwift

enum Theme { case light, dark }

extension Theme {

    var backgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor(named: UIColor.Name.BackgroundLight)
        case .dark:
            return UIColor(named: UIColor.Name.BackgroundDark)
        }
    }

}
