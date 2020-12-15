//
//  Comment.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 15/12/20.
//

import Foundation

/// Representation of a Comment from the API.
struct Comment: Decodable {
    /// The item's type. In this case, `comment`.
    let type: String
    /// The comment's author.
    let by: String
    /// The comment's unique ID.
    let id: Int
    /// The unique IDs of each related comment.
    let kids: [Int]
    /// The unique ID of the comment's item.
    let parent: Int
    /// The comment's content.
    let text: String
    /// The comment's creation date in Unix time.
    let time: Int
}
