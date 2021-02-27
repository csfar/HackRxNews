//
//  TopStoriesViewModelSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 13/12/20.
//

import Quick
import Nimble
import RxTest
import RxBlocking
import RxSwift
@testable import HackRxNews

final class TopStoriesViewModelSpec: QuickSpec {
    override func spec() {
        var sut: TopStoriesViewModel!
        var service: NetworkServiceMock!
        var networkManager: NetworkManagerProtocol!
        var scheduler: ConcurrentDispatchQueueScheduler!

        describe("when initialized") {

            beforeEach {
                let bundle = Bundle(for: type(of: self))
                let jsonURL = bundle.url(forResource: "top-stories-response", withExtension: "json")
                service = NetworkServiceMock(bundle: bundle)
                service.json = jsonURL

                scheduler = ConcurrentDispatchQueueScheduler(qos: .default)

                let navigationController = UINavigationController()
                networkManager = NetworkManager(service: service)
                let coordinator = FeedCoordinator(navigationController: navigationController)
                sut = TopStoriesViewModel(networkManager: networkManager, coordinator: coordinator)
            }

            afterEach {
                sut = nil
                service = nil
                scheduler = nil
            }

            it("should have a driver of fetched viewmodels") {

                let sutObservable = sut.stories.asObservable().subscribe(on: scheduler)


                let data = try! Data(contentsOf: service.json!)
                let ids = try! JSONDecoder().decode([ItemID].self, from: data)
                let expectedViewModels = ids.map { StoryViewModel(storyID: $0, networkManager: networkManager) }

                let sutViewModels = try! sutObservable.toBlocking(timeout: 1.0).first()!

                expect(expectedViewModels.first!.storyID).to(equal(sutViewModels.first!.storyID))
            }
        }
    }
}
