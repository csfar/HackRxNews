//
//  TopStoriesViewModelSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 13/12/20.
//

import Quick
import Nimble
import RxTest
import RxSwift
@testable import HackRxNews

final class TopStoriesViewModelSpec: QuickSpec {
    override func spec() {
        describe("when initialized") {
            var sut: TopStoriesViewModel!
            var service: NetworkServiceMock!
            var scheduler: TestScheduler!
            var disposeBag: DisposeBag!

            beforeEach {
                let bundle = Bundle(for: type(of: self))
                let jsonURL = bundle.url(forResource: "top-stories-response", withExtension: "json")
                service = NetworkServiceMock(bundle: bundle)
                service.json = jsonURL

                scheduler = TestScheduler(initialClock: 0)
                disposeBag = DisposeBag()

                let navigationController = UINavigationController()
                let networkManager = NetworkManager(service: service)
                let coordinator = FeedCoordinator(navigationController: navigationController, networkManager: networkManager)
                sut = TopStoriesViewModel(networkManager: networkManager, coordinator: coordinator)
            }

            afterEach {
                sut = nil
                service = nil
                scheduler = nil
                disposeBag = nil
            }

            it("should have a driver of viewmodels") {
                let stories = scheduler.createObserver([TopStoryViewModel].self)

                sut.stories
                    .drive(stories)
                    .disposed(by: disposeBag)


                let data = try! Data(contentsOf: service.json!)
                let expectedIDs = try! JSONDecoder().decode([ItemID].self, from: data)

                let ids = stories.events
                    .map { $0.value.map {
                        $0.map {
                            $0.storyID } } }
                    .compactMap { $0.event.element }
                    .flatMap { $0 }


                expect(ids).toEventually(equal(expectedIDs), timeout: .seconds(2))
            }
        }
    }
}
