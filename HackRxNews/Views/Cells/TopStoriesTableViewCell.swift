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
    @AutoLayout private var titleButton: UIButton
    /// The story's author.
    @AutoLayout private var authorButton: UIButton
    /// The story's points.
    @AutoLayout private var pointsLabel: HackRxLabel
    /// The story's date of posting.
    @AutoLayout private var dateLabel: HackRxLabel
    /// The story's number of comments.
    @AutoLayout private var commentsButton: UIButton

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
        setUpTitleButton()
        setUpAuthorButton()
        setUpPointsLabel()
        setUpDateLabel()
        setUpCommentsButton()
    }

    /// Sets up the title button.
    private func setUpTitleButton() {

    }

    /// Sets up the author button.
    private func setUpAuthorButton() {

    }

    /// Sets up the points label.
    private func setUpPointsLabel() {
        pointsLabel.style(.points)
    }

    /// Sets up the date label.
    private func setUpDateLabel() {
        pointsLabel.style(.date)
    }

    /// Sets up the comments button.
    private func setUpCommentsButton() {
    }

    // MARK: - Layout
    /// Bundles all views' `layoutConstraints` function.
    private func layoutConstraints() {

    }
}
