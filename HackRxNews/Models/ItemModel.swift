//
//  StoryModel.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 30/11/20.
//

import Foundation

/// Representation of an item from the API.
struct ItemModel: Decodable {
    /// The item's unique ID.
    let id: Int

    /// Whether or not an item is deleted.
    let deleted: Bool

    /// The type of the item.
    let type: String

    /// The item's author
    let by: String

    /// The creation date of the item in Unix Time.
    let time: TimeInterval

    /// The item's content.
    let text: String

    /// Whether or not an item is dead.
    let dead: Bool

    /// The item's parent.
    let parent: Int

    /// ?
    let poll: Int

    /// The item's commnets as IDs.
    let kids: [Int]

    /// The item's URL
    let url: String

    /// The item's score
    let score: Int

    /// The item's title.
    let title: String

    /// ?
    let parts: [Int]

    /// The total number of comments.
    let descendants: Int
}

#if DEBUG
extension ItemModel {
    static func generate(_ amount: Int) -> [ItemModel] {
        return Array(repeating: ItemModel(id: 1,
                                          deleted: false,
                                          type: "story",
                                          by: "janejohn",
                                          time: 1606703820,
                                          text: "",
                                          dead: false,
                                          parent: 0,
                                          poll: 0,
                                          kids: [],
                                          url: "",
                                          score: 999,
                                          title: "Show HN: HackRxNews",
                                          parts: [],
                                          descendants: 381), count: amount)
    }
}
#endif