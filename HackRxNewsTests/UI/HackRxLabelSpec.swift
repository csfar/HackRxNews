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
                        sut.frame.size = CGSize(width: 150, height: 50)
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
                        sut.frame.size = CGSize(width: 150, height: 50)
                        sut.text = "8 hours ago"
                    }

                    it("should be correctly styled") {
                        expect(sut).toEventually(haveValidSnapshot(named: "hackrxlabel-date-style"), timeout: .seconds(1))
                    }
                }

                context("given the Style.title") {
                    beforeEach {
                        sut = HackRxLabel(frame: .zero)
                        sut.style(.title)
                        sut.frame.size = CGSize(width: 300, height: 100)
                        sut.text = "Show HN: HackRxNews"
                    }

                    it("should be correctly styled") {
                        expect(sut).toEventually(haveValidSnapshot(named: "hackrxlabel-title-style"), timeout: .seconds(1))
                    }
                }

                context("given the Style.author") {
                    beforeEach {
                        sut = HackRxLabel(frame: .zero)
                        sut.style(.author)
                        sut.frame.size = CGSize(width: 150, height: 50)
                        sut.text = "janejohn"
                    }

                    it("should be correctly styled") {
                        expect(sut).toEventually(haveValidSnapshot(named: "hackrxlabel-author-style"), timeout: .seconds(1))
                    }
                }

                context("given the Style.comments") {
                    beforeEach {
                        sut = HackRxLabel(frame: .zero)
                        sut.style(.comments)
                        sut.frame.size = CGSize(width: 150, height: 50)
                        sut.text = "301 comments"
                    }

                    it("should be correctly styled") {
                        expect(sut).toEventually(haveValidSnapshot(named: "hackrxlabel-comments-style"), timeout: .seconds(1))
                    }
                }
            }
        }
    }
}
