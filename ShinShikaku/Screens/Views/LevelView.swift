//
//  LevelView.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/23/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import UIKit

final class LevelView: UIView {

    lazy var gridView: GridView = {
        let gView = GridView(frame: .zero)
        gView.translatesAutoresizingMaskIntoConstraints = false
        return gView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension LevelView: ViewConfigurable {

    func configureViews() {
        addSubview(gridView)
    }

    func configureConstraints() {}

    func configureBindings() {}

}
