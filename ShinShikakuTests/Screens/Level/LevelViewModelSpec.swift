//
//  LevelViewModelSpec.swift
//  ShinShikakuTests
//
//  Created by Matthew Buckley on 7/24/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ShinShikaku

class LevelViewModelSpec: QuickSpec {

    override func spec() {

        var vm: LevelViewModel!

        describe("Models") {

            beforeEach {
                let winConditions = [WinCondition(position: Position.zero, dimensions: Dimensions(width: 5, height: 5))]
                let level = try! Level(winConditions: winConditions, grid: GridGenerator.generateBoard(with: LevelViewModel.generateTileState(for:), width: 5, height: 5))
                vm = LevelViewModel(level: level)
            }

            it("Has a Level") {
                expect(vm.level).toNot(beNil())
            }

        }

    }

}
