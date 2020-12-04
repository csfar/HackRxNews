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

    /// The relay stream for `StoryID`.
    private var storiesRelay: BehaviorRelay<[TopStoryViewModel]> = BehaviorRelay(value: [])

    /// Initializes a new instance of this type.
    init() {
        storiesRelay.accept([])
    }

    /// The top stories.
    var stories: Observable<[TopStoryViewModel]> {
        storiesRelay.asObservable()
    }
}
