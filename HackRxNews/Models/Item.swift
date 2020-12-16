//
//  StoryModel.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 30/11/20.
//

import Foundation

/// Representation of an item from the API.
struct Item: Decodable {
    /// The item's unique ID.
    let id: Int

    /// Whether or not an item is deleted.
    let deleted: Bool?

    /// The type of the item.
    let type: String

    /// The item's author
    let by: String

    /// The creation date of the item in Unix Time.
    let time: TimeInterval

    /// The item's content.
    let text: String?

    /// Whether or not an item is dead.
    let dead: Bool?

    /// The item's parent.
    let parent: Int?

    /// ?
    let poll: Int?

    /// The item's commnets as IDs.
    let kids: [Int]?

    /// The item's URL
    let url: String?

    /// The item's score
    let score: Int?

    /// The item's title.
    let title: String?

    /// ?
    let parts: [Int]?

    /// The total number of comments.
    let descendants: Int?

    init(id: Int = 0,
         deleted: Bool = false,
         type: String = "",
         by: String = "",
         time: TimeInterval = 1,
         text: String = "",
         dead: Bool = false,
         parent: Int = 0,
         poll: Int = 0,
         kids: [Int] = [],
         url: String = "",
         score: Int = 0,
         title: String = "",
         parts: [Int] = [],
         descendants: Int = 0) {
        self.id = id
        self.deleted = deleted
        self.type = type
        self.by = by
        self.time = time
        self.text = text
        self.dead = dead
        self.parent = parent
        self.poll = poll
        self.kids = kids
        self.url = url
        self.score = score
        self.title = title
        self.parts = parts
        self.descendants = descendants
    }
}

extension Item: Equatable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.id == rhs.id &&
            lhs.deleted == rhs.deleted &&
            lhs.type == rhs.type &&
            lhs.by == rhs.by &&
            lhs.time == rhs.time &&
            lhs.text == rhs.text &&
            lhs.dead == rhs.dead &&
            lhs.parent == rhs.parent &&
            lhs.poll == rhs.poll &&
            lhs.kids == rhs.kids &&
            lhs.url == rhs.url &&
            lhs.score == rhs.score &&
            lhs.title == rhs.title &&
            lhs.parts == rhs.parts &&
            lhs.descendants == rhs.descendants
    }
}
