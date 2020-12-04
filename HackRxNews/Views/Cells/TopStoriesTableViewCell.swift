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
    @HackRxLabelWrapper(style: .title) private var titleLabel: HackRxLabel
    /// The story's author.
    @HackRxLabelWrapper(style: .author) private var authorLabel: HackRxLabel
    /// The story's points.
    @HackRxLabelWrapper(style: .points) private var pointsLabel: HackRxLabel
    /// The story's date of posting.
    @HackRxLabelWrapper(style: .date) private var dateLabel: HackRxLabel
    /// The story's number of comments.
    @HackRxLabelWrapper(style: .comments) private var commentsLabel: HackRxLabel

    /// The `ViewModel`for this `View`.
    private var viewModel: TopStoryViewModel?

    // MARK: - Identifier
    /// The cell's identifier.
    static var identifier: String {
        return String(describing: self)
    }

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        layoutConstraints()
        contentView.backgroundColor = .white
        backgroundColor = .white
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API
    func with(storyID: StoryID) {
        guard let viewModel = viewModel else {
            return
        }

        
    }

    // MARK: - Layout
    /// Adds all views to `contentView` as subviews.
    private func addViews() {
        contentView.addSubview(pointsLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(commentsLabel)
    }

    /// Bundles all views' `layoutConstraints` function.
    private func layoutConstraints() {
        layoutPointsLabelConstraints()
        layoutTitleLabelConstraints()
        layoutAuthorLabelConstraints()
        layoutDateLabelConstraints()
        layoutCommentsLabelConstraints()
    }

    private func layoutPointsLabelConstraints() {
        let guides = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            pointsLabel.leftAnchor.constraint(equalTo: guides.leftAnchor),
            pointsLabel.heightAnchor.constraint(equalTo: guides.heightAnchor),
            pointsLabel.widthAnchor.constraint(equalTo: guides.widthAnchor,
                                               multiplier: TopStoriesDesignSystem.Cell.pointsWidthMultiplier),
            pointsLabel.centerYAnchor.constraint(equalTo: guides.centerYAnchor)
        ])
    }

    private func layoutTitleLabelConstraints() {
        let guides = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: guides.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor,
                                                constant: TopStoriesDesignSystem.Cell.spacingFromPoints),
            titleLabel.trailingAnchor.constraint(equalTo: guides.trailingAnchor)
        ])
    }

    private func layoutAuthorLabelConstraints() {
        let guides = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                             constant: TopStoriesDesignSystem.Cell.defaultSpacing),
            authorLabel.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor,
                                                 constant: TopStoriesDesignSystem.Cell.spacingFromPoints),
            authorLabel.trailingAnchor.constraint(equalTo: guides.trailingAnchor)
        ])
    }

    private func layoutDateLabelConstraints() {
        let guides = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor,
                                           constant: TopStoriesDesignSystem.Cell.defaultSpacing),
            dateLabel.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor,
                                               constant: TopStoriesDesignSystem.Cell.spacingFromPoints),
            dateLabel.trailingAnchor.constraint(equalTo: commentsLabel.leadingAnchor,
                                                constant: TopStoriesDesignSystem.Cell.dateSpacingfromComments),
            dateLabel.bottomAnchor.constraint(equalTo: guides.bottomAnchor)
        ])
    }

    private func layoutCommentsLabelConstraints() {
        let guides = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            commentsLabel.topAnchor.constraint(equalTo: authorLabel.bottomAnchor,
                                               constant: TopStoriesDesignSystem.Cell.defaultSpacing),
            commentsLabel.trailingAnchor.constraint(equalTo: guides.trailingAnchor),
            commentsLabel.bottomAnchor.constraint(equalTo: guides.bottomAnchor)
        ])
    }
}
