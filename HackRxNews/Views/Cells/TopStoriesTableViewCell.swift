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
    @AutoLayout private var titleLabel: UIButton
    /// The story's author.
    @AutoLayout private var authorLabel: UIButton
    /// The story's points.
    @AutoLayout private var pointsLabel: UILabel
    /// The story's date of posting.
    @AutoLayout private var dateLabel: UILabel
    /// The story's number of comments.
    @AutoLayout private var commentsLabel: UIButton


    // MARK: - Identifier
    /// The cell's identifier.
    static var identifier: String {
        return String(describing: self)
    }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        layoutConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Views setup
    /// Bundles all views' `setUp` function.
    private func setUpViews() {

    }

    private func setUpTitleLabel() {
    }

    // MARK: - Layout
    /// Bundles all views' `layoutConstraints` function.
    private func layoutConstraints() {

    }
}
