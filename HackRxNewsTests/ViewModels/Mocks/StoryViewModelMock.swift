//
//  StoryViewModelMock.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 06/03/21.
//

import RxSwift
import RxCocoa

@testable import HackRxNews

final class StoryViewModelMock: StoryViewModelProtocol {
    private(set) var didFetch: Bool = false
    private(set) var didSetTitleBinding: Bool = false
    private(set) var didSetAuthorBinding: Bool = false
    private(set) var didSetDateOfPostingBinding: Bool = false
    private(set) var didSetPointsBinding: Bool = false
    private(set) var didSetNumberOfCommentsBinding: Bool = false

    var observable: Observable<Item>!

    var storyID: ItemID = 0

    var title: Driver<String> {
        didSetTitleBinding = true
        return observable.map { $0.title ?? "-" }
            .asDriver(onErrorJustReturn: "-")
    }

    var author: Driver<String> {
        didSetAuthorBinding = true
        return observable.map { "by \($0.by)" }
            .asDriver(onErrorJustReturn: "-")
    }

    var dateOfPosting: Driver<String> {
        didSetDateOfPostingBinding = true
        return observable.map {
            let dateOfCreation = Date(timeIntervalSince1970: $0.time)
            let dateFormatter = RelativeDateTimeFormatter()
            dateFormatter.unitsStyle = .full

            return dateFormatter.localizedString(for: dateOfCreation, relativeTo: Date())
        }.asDriver(onErrorJustReturn: "-")
    }

    var numberOfComments: Driver<String> {
        didSetNumberOfCommentsBinding = true
        return observable.map { "\($0.descendants ?? 0) comments" }
            .asDriver(onErrorJustReturn: "-")
    }

    var points: Driver<String> {
        didSetPointsBinding = true
        return observable.map { "\($0.score ?? 0)" }
            .asDriver(onErrorJustReturn: "-")
    }

    func fetch() {
        didFetch = true
    }
}
