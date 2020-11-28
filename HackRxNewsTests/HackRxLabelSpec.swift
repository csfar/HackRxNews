//
//  HackRxLabelSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 28/11/20.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import HackRxNews

final class HackRxLabelSpec: QuickSpec {
    override func spec() {
        describe("HackRxLabel") {
            var sut: HackRxLabel!

            describe("when") {
                context("given the Style.points") {
                    beforeEach {
                        sut = HackRxLabel(frame: .zero)
                        sut.style(.points)
                        sut.frame.size = CGSize(width: 100, height: 50)
                        sut.text = "999 points"
                    }

                    it("should be correctly styled") {
                        expect(sut).toEventually(haveValidSnapshot(named: "hackrxlabel-points-style"), timeout: .seconds(1))
                    }
                }

                context("given the Style.date") {
                    beforeEach {
                        sut = HackRxLabel(frame: .zero)
                        sut.style(.date)
                        sut.frame.size = CGSize(width: 100, height: 50)
                        sut.text = "8 hours ago"
                    }

                    it("should be correctly styled") {
                        expect(sut).toEventually(haveValidSnapshot(named: "hackrxlabel-date-style"), timeout: .seconds(1))
                    }
                }
            }
        }
    }
}
