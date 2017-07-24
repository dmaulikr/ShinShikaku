//
//  GridViewSpec.swift
//  ShinShikakuTests
//
//  Created by Matthew Buckley on 7/23/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ShinShikaku

class GridViewSpec: QuickSpec {

    override func spec() {

        let gridView = GridView(rowCount: 3, columnCount: 7)

        describe("UI") {

            it("Must have a horizontal axis") {
                expect(gridView.axis == .horizontal).to(beTrue())
            }

            it("Must have subviews equal to the column count") {
                expect(gridView.subviews.count).to(equal(7))
            }

            it("Each column must have a number of subviews equal to the rowCount") {
                for col in gridView.subviews {
                    expect(col.subviews.count).to(equal(3))
                }
            }

            it("Must have distribution set to .fillEqually") {
                expect(gridView.distribution == .fillEqually).to(beTrue())
            }

            it("Each column must also have distribution set to .fillEqually") {
                for colIdx in stride(from: 0, to: gridView.subviews.count, by: 1) {
                    let col = gridView.subviews[colIdx] as! UIStackView
                    expect(col.distribution == .fillEqually).to(beTrue())
                }
            }

            it("Each column must have subviews which are of type TileView") {
                for colIdx in stride(from: 0, to: gridView.subviews.count, by: 1) {
                    let col = gridView.subviews[colIdx]
                    expect(col.subviews.filter({ !($0 is TileView) }).count).to(equal(0))
                }
            }
        }

    }

}
