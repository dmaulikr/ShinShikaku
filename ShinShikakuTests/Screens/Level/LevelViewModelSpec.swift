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

        let vm = LevelViewModel(level: Level(winConditions: []))

        describe("Models") {

            it("Has a Level") {
                expect(vm.level).toNot(beNil())
            }

        }

    }

}
