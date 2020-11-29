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
                    let viewModel = TopStoryViewModel(title: "Show HN: HackRxNews",
                                                      author: "by janejohn",
                                                      dateOfPosting: "8 hours ago",
                                                      numberOfComments: "381 comments",
                                                      points: "999")
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
