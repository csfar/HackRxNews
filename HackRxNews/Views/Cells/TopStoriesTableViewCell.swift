//
//  TopStoriesTableViewCell.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 27/11/20.
//

import UIKit
import RxSwift
import RxCocoa

/// Representation of a top story in the `Top Stories` screen.
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

    /// The dispose bag used by this object.
    private var disposeBag: DisposeBag?

    /// The `ViewModel`for this `View`.
    private var viewModel: StoryViewModelProtocol? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }

            let disposeBag = DisposeBag()

            viewModel.title
                .drive(titleLabel.rx.text)
                .disposed(by: disposeBag)

            viewModel.author
                .drive(authorLabel.rx.text)
                .disposed(by: disposeBag)

            viewModel.points
                .drive(pointsLabel.rx.text)
                .disposed(by: disposeBag)

            viewModel.dateOfPosting
                .drive(dateLabel.rx.text)
                .disposed(by: disposeBag)

            viewModel.numberOfComments
                .drive(commentsLabel.rx.text)
                .disposed(by: disposeBag)
                
            self.disposeBag = disposeBag
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
        accessoryType = .disclosureIndicator
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()

        self.viewModel = nil
        self.disposeBag = nil
    }

    // MARK: - API
    /// Sets up the `ViewModel`.
    func setUp(with viewModel: StoryViewModelProtocol) {
        self.viewModel = viewModel
        viewModel.fetch()
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
