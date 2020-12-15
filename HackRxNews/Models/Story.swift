//
//  Story.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 15/12/20.
//

import Foundation

/// Representation of a Story from the API.
struct Story: Decodable {
    /// The item's type. In this case, `story`.
    let type: String
    /// The story's author.
    let by: String
    /// The number of comments.
    let descendants: Int
    /// The story's unique ID.
    let id: ItemID
    /// The unique IDs of each comment.
    let kids: [Int]
    /// The story's score.
    let score: Int
    /// The story's creation date in Unix time.
    let time: TimeInterval
    /// The story's title.
    let title: String
    /// The story's URL as a `String`.
    let url: String
}
