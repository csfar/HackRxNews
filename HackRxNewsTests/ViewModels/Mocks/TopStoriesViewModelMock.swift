//
//  TopStoriesViewModelMock.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 06/02/21.
//

import RxSwift
import RxCocoa

@testable import HackRxNews

final class TopStoriesViewModelMock: TopStoriesViewModelProtocol {
    var relay: BehaviorRelay<[StoryViewModelProtocol]> = BehaviorRelay<[StoryViewModelProtocol]>(value: [])

    private(set) var didSetBinding: Bool = false
    private(set) var selectedViewModel: StoryViewModelProtocol?

    var stories: Driver<[StoryViewModelProtocol]> {
        didSetBinding = true
        return relay.asDriver(onErrorJustReturn: [])
    }

    func didSelect(story viewModel: StoryViewModelProtocol) {
        selectedViewModel = viewModel
    }


}
