//
//  WinConditionSpec.swift
//  ShinShikakuTests
//
//  Created by Matthew Buckley on 7/24/17.
//  Copyright © 2017 Nice Things LLC. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import ShinShikaku

class WinConditionSpec: QuickSpec {

    override func spec() {

        let winConditionA = WinCondition(position: .zero, dimensions: Dimensions(width: 0, height: 0))
        let winConditionB = WinCondition(position: .zero, dimensions: Dimensions(width: 0, height: 0))
        let winConditionC = WinCondition(position: .zero, dimensions: Dimensions(width: 0, height: 1))
        let winConditionD = WinCondition(position: Position(x: 0, y: 1), dimensions: Dimensions(width: 1, height: 1))
        let winConditionE = WinCondition(position: Position(x: 1, y: 0), dimensions: Dimensions(width: 1, height: 0))

        describe("Protocol conformance") {
            it("implements Equatable") {
                expect(winConditionA == winConditionB).to(beTrue())
                expect(winConditionA == winConditionC).to(beFalse())
                expect(winConditionA == winConditionD).to(beFalse())
                expect(winConditionA == winConditionE).to(beFalse())
            }
        }

        describe("Properties") {
            it("Has a Position") {
                expect(winConditionA.position).toNot(beNil())
            }

            it("Has Dimensions") {
                expect(winConditionA.dimensions).toNot(beNil())
            }
        }
    }

}
