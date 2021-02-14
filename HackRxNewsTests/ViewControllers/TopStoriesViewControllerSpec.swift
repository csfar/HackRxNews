//
//  TopStoriesViewControllerTests.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 06/02/21.
//

import Quick
import Nimble

@testable import HackRxNews

final class TopStoriesViewControllerSpec: QuickSpec {
    override func spec() {
        var sut: TopStoriesViewController!
        var viewModel: TopStorieSViewModelMock!
        var service: NetworkServiceMock!
        var networkManager: NetworkManagerProtocol!

        beforeEach {
            let bundle = Bundle(for: type(of: self))
            service = NetworkServiceMock(bundle: bundle)
            let jsonURL = service.bundle.url(forResource: "item-response", withExtension: "json")
            service.json = jsonURL

            networkManager = NetworkManager(service: service)
            viewModel = TopStorieSViewModelMock()
            sut = TopStoriesViewController(viewModel: viewModel)
        }

        afterEach {
            service = nil
            networkManager = nil
            viewModel = nil
            sut = nil
        }

        describe("when initialized") {
            it("should set up bindings") {
                let viewModels = [TopStoryViewModel(storyID: 1006, networkManager: networkManager),
                               TopStoryViewModel(storyID: 1006, networkManager: networkManager),
                               TopStoryViewModel(storyID: 1006, networkManager: networkManager),
                               TopStoryViewModel(storyID: 1006, networkManager: networkManager),
                               TopStoryViewModel(storyID: 1006, networkManager: networkManager),
                               TopStoryViewModel(storyID: 1006, networkManager: networkManager),
                               TopStoryViewModel(storyID: 1006, networkManager: networkManager),
                               TopStoryViewModel(storyID: 1006, networkManager: networkManager),
                               TopStoryViewModel(storyID: 1006, networkManager: networkManager)]

                viewModel.relay.accept(viewModels)

                _ = sut.view

                expect(viewModel.didSetBinding).to(beTrue())
            }
        }
    }
}
