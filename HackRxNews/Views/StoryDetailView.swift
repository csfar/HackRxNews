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
    /// The header stack.
    @HackRxStackViewWrapper(style: .header) private var headerStackView: HackRxStackView
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

    /// The main stack.
    @HackRxStackViewWrapper(style: .default) private var mainStackView: HackRxStackView

    private var disposeBag: DisposeBag?

    private var viewModel: TopStoryViewModel? {
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
        mainStackView.axis = .vertical
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - ViewModel
    /// Sets up the `ViewModel`.
    func setUp(with viewModel: TopStoryViewModel) {
        self.viewModel = viewModel
        viewModel.fetch()
    }

    // MARK: - Layouts
    private func setUp() {
        addViews()
        layoutConstraints()
    }

    private func addViews() {
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(authorLabel)

        detailsStackView.addArrangedSubview(pointsLabel)
        detailsStackView.addArrangedSubview(dateLabel)
        detailsStackView.addArrangedSubview(commentsLabel)

        mainStackView.addArrangedSubview(headerStackView)
        mainStackView.addArrangedSubview(detailsStackView)

        addSubview(mainStackView)
    }

    private func layoutConstraints() {
        let guides = self.layoutMarginsGuide

        NSLayoutConstraint.activate([
            mainStackView.centerYAnchor.constraint(equalTo: guides.centerYAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: guides.centerXAnchor),
            mainStackView.heightAnchor.constraint(equalTo: guides.heightAnchor),
            mainStackView.widthAnchor.constraint(equalTo: guides.widthAnchor)
        ])
    }
}
