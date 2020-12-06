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
    // MARK: - Properties
    /// The manager used for performing HTTP requests.
    private let networkManager: NetworkManager

    private let viewModelsRelay: BehaviorRelay<[TopStoryViewModel]>

    /// The dispose  bag used by this object.
    private let disposeBag: DisposeBag

    // MARK: - Init
    /// Initializes a new instance of this type.
    /// - Parameter networkManager: The manager used for performing HTTP requests.
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        self.disposeBag = DisposeBag()
        self.viewModelsRelay = BehaviorRelay(value: [])

        let request = URLRequest(url: URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json")!)

        self.networkManager.perform(request, for: [StoryID].self)
            .observe(on: MainScheduler.instance)
            .map { $0.map { [weak self] in TopStoryViewModel(storyID: $0, networkManager: self?.networkManager) } }
            .subscribe { [weak self] (event) in
                guard let self = self else {
                    return
                }

                if let stories = event.element {
                    self.viewModelsRelay.accept(stories)
                }
            }.disposed(by: disposeBag)

    }

    // MARK: - API
    /// The top stories.
    var stories: Driver<[TopStoryViewModel]> {
        return viewModelsRelay.asDriver()
    }
}
