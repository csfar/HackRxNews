//
//  TopStoriesViewModel.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 30/11/20.
//

import RxSwift
import RxCocoa

final class TopStoriesViewModel {

    private var storiesRelay: BehaviorRelay<[ItemModel]> = BehaviorRelay(value: [])

    init() {
        storiesRelay.accept(ItemModel.generate(30))
    }

    var stories: Observable<[ItemModel]> {
        storiesRelay.asObservable()
    }
}
