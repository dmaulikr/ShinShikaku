//
//  GridView.swift
//  ShinShikaku
//
//  Created by Matthew Buckley on 7/23/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import UIKit

final class GridView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(rowCount: Int, columnCount: Int) {
        self.init(frame: .zero)

        // Configuration
        distribution = .fillEqually

        // Set up individual tiles
        for colIdx in stride(from: 0, to: columnCount, by: 1) {
            let stackView = UIStackView()
            stackView.distribution = .fillEqually
            addArrangedSubview(stackView)
            for _ in stride(from: 0, to: rowCount, by: 1) {
                if let col = subviews[colIdx] as? UIStackView {
                    col.addArrangedSubview(TileView())
                }
            }
        }
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
