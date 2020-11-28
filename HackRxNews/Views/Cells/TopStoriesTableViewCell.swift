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

    @AutoLayout private var infoStack: UIStackView

    private var viewModel: TopStoryViewModel? {
        didSet {
            if let viewModel = viewModel {
                titleLabel.text = viewModel.title
                authorLabel.text = viewModel.author
                pointsLabel.text = viewModel.points
                dateLabel.text = viewModel.dateOfPosting
                commentsLabel.text = viewModel.numberOfComments
            }
        }
    }

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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API
    func setUp(with viewModel: TopStoryViewModel) {
        self.viewModel = viewModel
    }

    // MARK: - Layout
    /// Adds all views to `contentView` as subviews.
    private func addViews() {
        contentView.addSubview(titleLabel)

        infoStack.addArrangedSubview(pointsLabel)
        infoStack.addArrangedSubview(authorLabel)
        infoStack.addArrangedSubview(dateLabel)
        infoStack.addArrangedSubview(commentsLabel)

        contentView.addSubview(infoStack)

        infoStack.axis = .horizontal
        infoStack.distribution = .equalSpacing
    }

    /// Bundles all views' `layoutConstraints` function.
    private func layoutConstraints() {
        layoutInfoStackConstraints()
        layoutTitleLabelConstraints()
    }

    private func layoutInfoStackConstraints() {
        let guides = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            infoStack.leadingAnchor.constraint(equalTo: guides.leadingAnchor),
            infoStack.trailingAnchor.constraint(equalTo: guides.trailingAnchor),
            infoStack.bottomAnchor.constraint(equalTo: guides.bottomAnchor)
        ])
    }

    private func layoutTitleLabelConstraints() {
        let guides = contentView.layoutMarginsGuide

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: guides.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: guides.leadingAnchor),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: guides.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: infoStack.topAnchor,
                                                constant: -5)
        ])
    }
}
