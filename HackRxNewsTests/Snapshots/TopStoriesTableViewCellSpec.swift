//
//  TopStoriesTableViewCellSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 09/12/20.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import HackRxNews

final class TopStoriesTableViewCellSpec: QuickSpec {
    override func spec() {
        describe("when initialized") {
            var sut: TopStoriesTableViewCell!
            var service: NetworkServiceMock!
            context("with a story") {
                beforeEach {
                    let bundle = Bundle(for: type(of: self))
                    service = NetworkServiceMock(bundle: bundle)
                    let jsonURL = service.bundle.url(forResource: "item-response", withExtension: "json")
                    service.json = jsonURL

                    let networkManager = NetworkManager(service: service)

                    let topStoryViewModel = StoryViewModel(storyID: 1006, networkManager: networkManager)

                    sut = TopStoriesTableViewCell()

                    sut.setUp(with: topStoryViewModel)
                    sut.frame.size = CGSize(width: UIScreen.main.bounds.width, height: 125)
                }

                afterEach {
                    sut = nil
                    service = nil
                }

                it("should layout and display data correctly") {
                    expect(sut).toEventually(haveValidSnapshot(named:"hackrx_top_stories_cell"), timeout: .seconds(1))
                }
            }
        }
    }
}
