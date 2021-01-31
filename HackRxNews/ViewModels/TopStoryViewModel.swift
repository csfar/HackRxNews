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
    let storyID: ItemID

    /// Whether or not the `ViewModel` has fetched already.
    private var hasFetched: Bool = false

    /// The dispose bag used by this object.
    private let disposeBag: DisposeBag

    /// The `ItemModel` observable for requesting an item.
    private let itemObservable: Observable<Item>

    /// The `ViewModel`'s item relay.
    private let itemRelay: BehaviorRelay<Item>

    /// The manager used for performing HTTP requests.
    private var networkManager: NetworkManagerProtocol?

    // MARK: - Init
    /// Initializes a new instance of this type.
    /// - Parameter storyID: The story's ID.
    /// - Parameter networkManager: The manager used for performing HTTP requests.
    init(storyID: ItemID,
         networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.storyID = storyID
        self.disposeBag = DisposeBag()
        self.itemRelay = BehaviorRelay(value: Item(title: "-"))
        self.networkManager = networkManager

        guard let url = Endpoint.item(storyID).url else {
            preconditionFailure("Failed to get URL from Endpoint")
        }

        let request = URLRequest(url: url)

        self.itemObservable = networkManager.perform(request, for: Item.self)
            .observe(on: MainScheduler.instance)
            .asObservable()
    }

    // MARK: - API
    /// The story's title.
    var title: Driver<String> {
        return itemRelay.map { $0.title ?? "-" }
            .asDriver(onErrorJustReturn: "-")
    }
    /// The story's author.
    var author: Driver<String> {
        return itemRelay.map { "by \($0.by)" }
            .asDriver(onErrorJustReturn: "-")
    }
    /// The story's date of posting.
    var dateOfPosting: Driver<String> {
        return itemRelay.map {
            let dateOfCreation = Date(timeIntervalSince1970: $0.time)
            let dateFormatter = RelativeDateTimeFormatter()
            dateFormatter.unitsStyle = .full

            return dateFormatter.localizedString(for: dateOfCreation, relativeTo: Date())
        }.asDriver(onErrorJustReturn: "-")
    }
    /// The story's number of comments.
    var numberOfComments: Driver<String> {
        return itemRelay.map { "\($0.descendants ?? 0) comments" }
            .asDriver(onErrorJustReturn: "-")
    }
    /// The story's number of points.
    var points: Driver<String> {
        return itemRelay.map { "\($0.score ?? 0)" }
            .asDriver(onErrorJustReturn: "-")
    }

    /// Fetches the item's data.
    func fetch() {
        if !hasFetched {

            itemObservable
                .map { $0 }
                .bind(to: itemRelay)
                .disposed(by: disposeBag)

            hasFetched = true
        }
    }
}
