//
//  TopStoryViewModel.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 28/11/20.
//

import Foundation

/// `ViewModel` responsible for a single `Top Story`.
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
    init(item: ItemModel) {
        self.title = item.title
        self.author = "by \(item.by)"

        let dateOfCreation = Date(timeIntervalSince1970: item.time)
        let dateFormatter = RelativeDateTimeFormatter()
        dateFormatter.unitsStyle = .full

        self.dateOfPosting = dateFormatter.localizedString(for: dateOfCreation, relativeTo: Date())

        self.numberOfComments = "\(item.descendants) comments"
        self.points = "\(item.score)"

    }
}
