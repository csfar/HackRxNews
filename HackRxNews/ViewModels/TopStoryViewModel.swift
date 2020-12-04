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
    /// The story's title.
    var title: Driver<String>
    /// The story's author.
    var author: Driver<String>
    /// The story's date of posting.
    var dateOfPosting: Driver<String>
    /// The story's number of comments.
    var numberOfComments: Driver<String>
    /// The story's number of points.
    var points: Driver<String>

    private let storyID: StoryID

    init(storyID: StoryID) {
        self.storyID = storyID

        self.title = Driver.never()
        self.author = Driver.never()
        self.dateOfPosting = Driver.never()
        self.numberOfComments = Driver.never()
        self.points = Driver.never()

        fetch(self.storyID)
    }

    private func fetch(_ story: StoryID) {
        
    }
}


//
//    /// Initializes a new instance of this type.
//    /// - Parameter item: Representation of an item from the API.
//    /// - Parameter relativeToDate: The relative date used when formatting. **For testing purposes only.**
//    init(item: ItemModel, relativeToDate: Date = Date()) {
//        self.title = item.title
//        self.author = "by \(item.by)"
//
//        let dateOfCreation = Date(timeIntervalSince1970: item.time)
//        let dateFormatter = RelativeDateTimeFormatter()
//        dateFormatter.unitsStyle = .full
//
//        self.dateOfPosting = dateFormatter.localizedString(for: dateOfCreation, relativeTo: relativeToDate)
//
//        self.numberOfComments = "\(item.descendants) comments"
//        self.points = "\(item.score)"
