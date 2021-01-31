//
//  TopStoriesTableViewSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 31/01/21.
//

import Quick
import Nimble
import Nimble_Snapshots
import RxSwift
import RxCocoa

@testable import HackRxNews

final class TopStoriesTableViewSpec: QuickSpec {
    override func spec() {
        describe("when initialized") {
            var sut: TopStoriesTableView!
            var service: NetworkServiceMock!
            var disposeBag: DisposeBag!
            context("with stories") {
                beforeEach {
                    let bundle = Bundle(for: type(of: self))
                    service = NetworkServiceMock(bundle: bundle)
                    let jsonURL = service.bundle.url(forResource: "item-response", withExtension: "json")
                    service.json = jsonURL

                    let networkManager = NetworkManager(service: service)

                    let viewModels = [TopStoryViewModel(storyID: 8863, networkManager: networkManager),
                                   TopStoryViewModel(storyID: 8863, networkManager: networkManager),
                                   TopStoryViewModel(storyID: 8863, networkManager: networkManager),
                                   TopStoryViewModel(storyID: 8863, networkManager: networkManager),
                                   TopStoryViewModel(storyID: 8863, networkManager: networkManager),
                                   TopStoryViewModel(storyID: 8863, networkManager: networkManager),
                                   TopStoryViewModel(storyID: 8863, networkManager: networkManager),
                                   TopStoryViewModel(storyID: 8863, networkManager: networkManager),
                                   TopStoryViewModel(storyID: 8863, networkManager: networkManager)]

                    let relay = BehaviorRelay<[TopStoryViewModel]>(value: viewModels)

                    disposeBag = DisposeBag()
                    
                    sut = TopStoriesTableView(frame: .zero)

                    relay.asDriver().drive(sut.rx
                                            .items(cellIdentifier: TopStoriesTableViewCell.identifier,
                                                        cellType: TopStoriesTableViewCell.self)) { (_, viewModel, cell) in
                        cell.setUp(with: viewModel)
                    }.disposed(by: disposeBag)

                    sut.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                }

                afterEach {
                    sut = nil
                    service = nil
                    disposeBag = nil
                }

                it("should layout and display data correctly") {
                    expect(sut).toEventually(haveValidSnapshot(named:"hackrx_top_stories_tableView"), timeout: .seconds(1))
                }
            }
        }
    }
}
