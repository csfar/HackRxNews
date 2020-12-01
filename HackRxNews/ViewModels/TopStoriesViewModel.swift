//
//  TopStoriesViewModel.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 30/11/20.
//

import RxSwift
import RxCocoa

/// `ViewModel` for `Top Stories`.
final class TopStoriesViewModel {

    /// The relay stream for `ItemModel`.
    private var storiesRelay: BehaviorRelay<[ItemModel]> = BehaviorRelay(value: [])

    /// Initializes a new instance of this type.
    init() {
        storiesRelay.accept(ItemModel.generate(30))
    }

    /// The top stories.
    var stories: Observable<[ItemModel]> {
        storiesRelay.asObservable()
    }
}
