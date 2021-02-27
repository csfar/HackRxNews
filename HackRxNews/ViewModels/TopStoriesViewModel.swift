//
//  TopStoriesViewModel.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 30/11/20.
//

import RxSwift
import RxCocoa

/// A representation of a `TopStoriesViewModel`.
protocol TopStoriesViewModelProtocol {
    var stories: Driver<[StoryViewModelProtocol]> { get }
    func didSelect(story viewModel: StoryViewModelProtocol)
}

/// `ViewModel` for `Top Stories`.
final class TopStoriesViewModel: TopStoriesViewModelProtocol {
    // MARK: - Properties
    /// The manager used for performing HTTP requests.
    private let networkManager: NetworkManagerProtocol

    /// The `TopStoryViewModel` relay. Used by a `Driver` to drive the UI.
    private let viewModelsRelay: BehaviorRelay<[StoryViewModelProtocol]>

    /// The Coordinator attatched to this ViewModel.
    private let coordinator: FeedCoordinator

    /// The dispose  bag used by this object.
    private let disposeBag: DisposeBag

    // MARK: - Init
    /// Initializes a new instance of this type.
    /// - Parameter networkManager: The manager used for performing HTTP requests.
    /// - Parameter coordinator: The Coordinator attatched to this ViewModel.
    init(networkManager: NetworkManagerProtocol = NetworkManager(),
         coordinator: FeedCoordinator) {
        self.coordinator = coordinator
        self.networkManager = networkManager
        self.disposeBag = DisposeBag()
        self.viewModelsRelay = BehaviorRelay(value: [])

        guard let endpoint = Endpoint.topStories.url else {
            preconditionFailure("Failed to get URL from Endpoint")
        }

        let request = URLRequest(url: endpoint)

        self.networkManager.perform(request, for: [ItemID].self)
            .map { $0.map { StoryViewModel(storyID: $0) } }
            .observe(on: MainScheduler.instance)
            .bind(to: viewModelsRelay)
            .disposed(by: disposeBag)

    }

    // MARK: - API
    /// The top stories.
    var stories: Driver<[StoryViewModelProtocol]> {
        return viewModelsRelay.asDriver(onErrorJustReturn: [])
    }

    /// Triggers action when a story is selected.
    func didSelect(story viewModel: StoryViewModelProtocol) {
        coordinator.didSelect(story: viewModel)
    }
}
