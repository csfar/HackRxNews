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

    /// The manager used for performing HTTP requests.
    private let networkManager: NetworkManager

    /// The dispose  bag used by this object.
    private let disposeBag: DisposeBag

    /// Initializes a new instance of this type.
    /// - Parameter networkManager: The manager used for performing HTTP requests.
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
        self.disposeBag = DisposeBag()

        self.stories = Driver.never()

        let request = URLRequest(url: URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json")!)

        self.stories = self.networkManager.perform(request, for: [StoryID].self)
            .map { $0.map { TopStoryViewModel(storyID: $0, networkManager: networkManager) } }
            .observe(on: MainScheduler.instance)
            .asDriver(onErrorJustReturn: [])
    }

    /// The top stories.
    var stories: Driver<[TopStoryViewModel]>
}
