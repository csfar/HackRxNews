//
//  TopStoriesViewControllerSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 10/12/20.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import HackRxNews

final class TopStoriesViewControllerSpec: QuickSpec {
    override func spec() {
        describe("when initialized") {
            var sut: TopStoriesViewController!
            context("with the top stories") {
                beforeEach {
                    let bundle = Bundle(for: type(of: self))
                    let jsonURL = bundle.url(forResource: "top-stories-response", withExtension: "json")
                    let service = NetworkServiceMock(bundle: bundle)
                    service.json = jsonURL

                    let navigationController = UINavigationController()
                    let networkManager = NetworkManager(service: service)
                    let coordinator = FeedCoordinator(navigationController: navigationController, networkManager: networkManager)
                    let viewModel = TopStoriesViewModel(networkManager: networkManager, coordinator: coordinator)

                    sut = TopStoriesViewController(viewModel: viewModel)

                    sut.view.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                }

                afterEach {
                    sut = nil
                }

                it("should layout and display data correctly") {
                    expect(sut).toEventually(haveValidSnapshot(named: "hackrx_top_stories_viewcontroller"), timeout: .seconds(1))
                }
            }
        }
    }
}
