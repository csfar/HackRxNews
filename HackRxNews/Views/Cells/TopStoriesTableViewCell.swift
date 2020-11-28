//
//  TopStoriesTableViewCell.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 27/11/20.
//

import UIKit

/// Representation of a top story in the `Top Stories` section.
final class TopStoriesTableViewCell: UITableViewCell {
    // MARK: - Properties
    /// The story's title.
    @HackRxButtonWrapper(style: .title) private var titleButton: HackRxButton
    /// The story's author.
    @HackRxButtonWrapper(style: .author) private var authorButton: HackRxButton
    /// The story's points.
    @HackRxLabelWrapper(style: .points) private var pointsLabel: HackRxLabel
    /// The story's date of posting.
    @HackRxLabelWrapper(style: .date) private var dateLabel: HackRxLabel
    /// The story's number of comments.
    @HackRxButtonWrapper(style: .comments) private var commentsButton: HackRxButton

    // MARK: - Identifier
    /// The cell's identifier.
    static var identifier: String {
        return String(describing: self)
    }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout
    /// Bundles all views' `layoutConstraints` function.
    private func layoutConstraints() {
    }

    private func layoutTitleButtonConstraints() {
        
    }
}
