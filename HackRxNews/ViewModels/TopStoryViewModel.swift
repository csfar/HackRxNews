//
//  TopStoryViewModel.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 28/11/20.
//

import Foundation

/// `ViewModel` for a `Top Story`.
struct TopStoryViewModel {
    /// The story's title.
    let title: String
    /// The story's author.
    let author: String
    /// The story's date of posting.
    let dateOfPosting: String
    /// The story's number of comments.
    let numberOfComments: String
    /// The story's number of points.
    let points: String

    /// Initializes a new instance of this type.
    /// - Parameter item: Representation of an item from the API.
    /// - Parameter relativeToDate: The relative date used when formatting. **For testing purposes only.**
    init(item: ItemModel, relativeToDate: Date = Date()) {
        self.title = item.title
        self.author = "by \(item.by)"

        let dateOfCreation = Date(timeIntervalSince1970: item.time)
        let dateFormatter = RelativeDateTimeFormatter()
        dateFormatter.unitsStyle = .full

        self.dateOfPosting = dateFormatter.localizedString(for: dateOfCreation, relativeTo: relativeToDate)

        self.numberOfComments = "\(item.descendants) comments"
        self.points = "\(item.score)"

    }
}
