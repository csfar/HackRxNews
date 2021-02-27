//
//  StoryDetailViewSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 14/02/21.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import HackRxNews

final class StoryDetailViewSpec: QuickSpec {
    override func spec() {
        describe("when initialized") {
            var sut: StoryDetailView!
            var service: NetworkServiceMock!
            context("with a story") {
                beforeEach {
                    let bundle = Bundle(for: type(of: self))
                    service = NetworkServiceMock(bundle: bundle)
                    let jsonURL = service.bundle.url(forResource: "item-response", withExtension: "json")
                    service.json = jsonURL

                    let networkManager = NetworkManager(service: service)

                    let topStoryViewModel = StoryViewModel(storyID: 1006, networkManager: networkManager)

                    sut = StoryDetailView(frame: .zero)
                    sut.setUp(with: topStoryViewModel)

                    sut.frame.size = CGSize(width: UIScreen.main.bounds.width, height: 100)
                }

                afterEach {
                    sut = nil
                    service = nil
                }

                it("should layout and display data correctly") {
                    expect(sut).toEventually(haveValidSnapshot(named:"hackrx_story_detail_view"), timeout: .seconds(1))
                }
            }
        }
    }
}
