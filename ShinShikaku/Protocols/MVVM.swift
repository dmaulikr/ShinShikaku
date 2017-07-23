//
//  MVVM.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/23/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import UIKit

protocol MVVM {

    var viewModel: Any! { get set }
    var primaryChildView: UIView! { get set }

}
