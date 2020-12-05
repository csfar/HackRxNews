//
//  TopStoriesTableViewSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 02/12/20.
//
//swiftlint disable_rules: force_cast

import Quick
import Nimble
import Nimble_Snapshots
import RxSwift
import RxCocoa

@testable import HackRxNews

// DO NOT USE THIS CODE AS REFERENCE FOR TESTING RXSWIFT USING NIMBLE-SNAPSHOTS.
// I DO NOT KNOW WHAT I AM DOING. IF YOU DO, PLEASE TELL ME.
//final class TopStoriesTableViewSpec: QuickSpec {
//    private lazy var disposeBag = DisposeBag()
//
//    override func spec() {
//        describe("TopStoriesTableView") {
//            var sut: TopStoriesTableView!
//
//            context("when initialized using Rx bindings") {
//
//                beforeSuite {
//                    let items = Array(repeating: ItemModel(by: "janejohn",
//                                                           score: 999,
//                                                           title: "Show HN: HackRxNews",
//                                                           descendants: 381),
//                                      count: 30)
//
//                    let itemsRelay = BehaviorRelay<[ItemModel]>(value: [])
//
//                    itemsRelay.accept(items)
//
//                    sut = TopStoriesTableView()
//
//
//                    itemsRelay.bind(to: sut.rx.items(cellIdentifier: TopStoriesTableViewCell.identifier,
//                                                     cellType: TopStoriesTableViewCell.self)) { (_, item, cell) in
//                        let viewModel = TopStoryViewModel(item: item, relativeToDate: Date(timeIntervalSince1970: 1000))
//                        cell.setUp(with: viewModel)
//                    }.disposed(by: self.disposeBag) // Is it okay to reference `self` in a Example/Example Group?
//                }
//            }
//
//            it("should display and layout data correctly") {
//                sut.frame.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//                
//                expect(sut).toEventually(haveValidSnapshot(named: "hackrx-topstories-tableview"), timeout: .seconds(1))
//            }
//
//        }
//    }
//}
