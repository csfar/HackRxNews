//
//  TopStoriesTableViewCellSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 28/11/20.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import HackRxNews

final class TopStoriesTableViewCellSpec: QuickSpec {
    override func spec() {
        describe("The Top Stories UITableViewCell") {
            var sut: TopStoriesTableViewCell!
            context("when initialized with a ViewModel") {
                beforeEach {
                    sut = TopStoriesTableViewCell(style: .default, reuseIdentifier: TopStoriesTableViewCell.identifier)
                    let item = ItemModel(by: "janejohn",
                                         score: 999,
                                         title: "Show HN: HackRxNews",
                                         descendants: 381)
                    let viewModel = TopStoryViewModel(item: item,
                                                      relativeToDate: Date(timeIntervalSince1970: 1000))
                    sut.setUp(with: viewModel)
                    sut.frame.size = CGSize(width: UIScreen.main.bounds.width, height: 100)
                }

                it("should display and layout data correctly") {
                    expect(sut).toEventually(haveValidSnapshot(named: "hackrx-topstories-cell"), timeout: .seconds(1))
                }
            }
        }
    }
}
