//
//  TopStoryViewModel.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 28/11/20.
//

import RxSwift
import RxCocoa

/// `ViewModel` for a `Top Story`.
final class TopStoryViewModel {
    // MARK: - Properties
    /// The story's ID.
    private let storyID: StoryID

    /// Whether or not the `ViewModel` has fetched already.
    private var hasFetched: Bool = false

    /// The dispose bag used by this object.
    private let disposeBag: DisposeBag

    /// The `ItemModel` observable for requesting an item.
    private let itemObservable: Observable<ItemModel>

    /// The `ViewModel`'s item relay.
    private let itemRelay: BehaviorRelay<ItemModel>

    /// The manager used for performing HTTP requests.
    private var networkManager: NetworkManager?

    // MARK: - Init
    /// Initializes a new instance of this type.
    /// - Parameter storyID: The story's ID.
    /// - Parameter networkManager: The manager used for performing HTTP requests.
    init(storyID: StoryID,
         networkManager: NetworkManager?) {
        self.storyID = storyID
        self.disposeBag = DisposeBag()
        self.itemRelay = BehaviorRelay(value: ItemModel(title: "Loading..."))

        if let unwrappedNetworkManager = networkManager {
            self.networkManager = unwrappedNetworkManager
            let urlRequest = URLRequest(url: URL(string: "https://hacker-news.firebaseio.com/v0/item/\(storyID).json")!)
            self.itemObservable = unwrappedNetworkManager.perform(urlRequest, for: ItemModel.self)
                .observe(on: MainScheduler.instance)
        } else {
            self.itemObservable = Observable.empty()
        }
    }

    // MARK: - API
    /// The story's title.
    var title: Driver<String> {
        return itemRelay.map { $0.title }
            .asDriver(onErrorJustReturn: "TITLE")
    }
    /// The story's author.
    var author: Driver<String> {
        return itemRelay.map { "by \($0.by)" }
            .asDriver(onErrorJustReturn: "AUTHOR")
    }
    /// The story's date of posting.
    var dateOfPosting: Driver<String> {
        return itemRelay.map {
            let dateOfCreation = Date(timeIntervalSince1970: $0.time)
            let dateFormatter = RelativeDateTimeFormatter()
            dateFormatter.unitsStyle = .full

            return dateFormatter.localizedString(for: dateOfCreation, relativeTo: Date())
        }.asDriver(onErrorJustReturn: "DATE")
    }
    /// The story's number of comments.
    var numberOfComments: Driver<String> {
        return itemRelay.map { "\($0.descendants) comments" }
            .asDriver(onErrorJustReturn: "COMMENTS")
    }
    /// The story's number of points.
    var points: Driver<String> {
        return itemRelay.map { "\($0.score)" }
            .asDriver(onErrorJustReturn: "999")
    }

    /// Fetches the item's data.
    func fetch() {
        if !hasFetched {

            itemObservable.subscribe { [weak self] (item) in
                self?.itemRelay.accept(item)
            }.disposed(by: disposeBag)

            hasFetched = true
        }
    }
}
