//
//  StoryDetailView.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 14/02/21.
//

import UIKit
import RxSwift
import RxCocoa

/// Representation of a story's details.
final class StoryDetailView: UIView {
    // MARK: - Properties
    /// The story's title.
    @HackRxLabelWrapper(style: .title) private var titleLabel: HackRxLabel
    /// The story's author.
    @HackRxLabelWrapper(style: .author) private var authorLabel: HackRxLabel

    /// The details stack.
    @HackRxStackViewWrapper(style: .details) private var detailsStackView: HackRxStackView
    /// The story's points.
    @HackRxLabelWrapper(style: .points) private var pointsLabel: HackRxLabel
    /// The story's date of posting.
    @HackRxLabelWrapper(style: .date) private var dateLabel: HackRxLabel
    /// The story's number of comments.
    @HackRxLabelWrapper(style: .comments) private var commentsLabel: HackRxLabel

    private var disposeBag: DisposeBag?

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

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewModel
    /// Sets up the `ViewModel`.
    func setUp(with viewModel: StoryViewModelProtocol) {
        self.viewModel = viewModel
        viewModel.fetch()
    }

    // MARK: - Layouts
    private func setUp() {
        addViews()
        layoutConstraints()
    }

    private func addViews() {
        addSubview(titleLabel)
        addSubview(authorLabel)

        detailsStackView.addArrangedSubview(pointsLabel)
        detailsStackView.addArrangedSubview(dateLabel)
        detailsStackView.addArrangedSubview(commentsLabel)

        addSubview(detailsStackView)
    }

    /// Bundles all views' `layoutConstraints` function.
    private func layoutConstraints() {
        layoutTitleLabelConstraints()
        layoutAuthorLabelConstraints()
        layoutDetailsStackViewConstraints()
    }

    private func layoutTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    private func layoutAuthorLabelConstraints() {
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                             constant: StoryDetailScreenDesignSystem.View.defaultSpacing),
            authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

    private func layoutDetailsStackViewConstraints() {
        NSLayoutConstraint.activate([
            detailsStackView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor,
                                           constant: StoryDetailScreenDesignSystem.View.defaultSpacing),
            detailsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            detailsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            detailsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
