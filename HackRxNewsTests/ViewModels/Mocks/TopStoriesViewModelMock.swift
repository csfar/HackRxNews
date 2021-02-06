//
//  TopStoriesViewModelMock.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 06/02/21.
//

import RxSwift
import RxCocoa

@testable import HackRxNews

final class TopStorieSViewModelMock: TopStoriesViewModelProtocol {

    var relay: BehaviorRelay<[TopStoryViewModel]> = BehaviorRelay<[TopStoryViewModel]>(value: [])

    private(set) var didSetBinding: Bool = false

    var stories: Driver<[TopStoryViewModel]> {
        didSetBinding = true
        return relay.asDriver(onErrorJustReturn: [])
    }
}
