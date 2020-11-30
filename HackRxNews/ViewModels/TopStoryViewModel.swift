//
//  TopStoryViewModel.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 28/11/20.
//

import Foundation

struct TopStoryViewModel {
    let title: String
    let author: String
    let dateOfPosting: String
    let numberOfComments: String
    let points: String

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
