//
//  HackRxButtonSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 28/11/20.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import HackRxNews

final class HackRxButtonSpec: QuickSpec {
    override func spec() {
        describe("HackRxButton") {
            var sut: HackRxButton!

            describe("when") {
                context("given the Style.title") {
                    beforeEach {
                        sut = HackRxButton(frame: .zero)
                        sut.style(.title)
                        sut.frame.size = CGSize(width: 300, height: 50)
                        sut.setTitle("Show HN: HackRxNews", for: .normal)
                    }

                    it("should be correctly styled") {
                        expect(sut).toEventually(haveValidSnapshot(named: "hackrxbutton-title-style"), timeout: .seconds(1))
                    }
                }

                context("given the Style.author") {
                    beforeEach {
                        sut = HackRxButton(frame: .zero)
                        sut.style(.author)
                        sut.frame.size = CGSize(width: 100, height: 50)
                        sut.setTitle("janejohn", for: .normal)
                    }

                    it("should be correctly styled") {
                        expect(sut).toEventually(haveValidSnapshot(named: "hackrxbutton-author-style"), timeout: .seconds(1))
                    }
                }

                context("given the Style.comments") {
                    beforeEach {
                        sut = HackRxButton(frame: .zero)
                        sut.style(.comments)
                        sut.frame.size = CGSize(width: 200, height: 50)
                        sut.setTitle("381 comments", for: .normal)
                    }

                    it("should be correctly styled") {
                        expect(sut).toEventually(haveValidSnapshot(named: "hackrxbutton-comments-style"), timeout: .seconds(1))
                    }
                }
            }
        }
    }
}
