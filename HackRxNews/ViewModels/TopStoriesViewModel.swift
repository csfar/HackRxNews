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

    /// The `TopStoryViewModel` relay. Used by a `Driver` to drive the UI.
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

        guard let endpoint = Endpoint.topStories.url else {
            preconditionFailure("Failed to get URL from Endpoint")
        }

        let request = URLRequest(url: endpoint)

        self.networkManager.perform(request, for: [ItemID].self)
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
