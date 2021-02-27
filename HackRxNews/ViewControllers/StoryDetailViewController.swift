//
//  StoryDetailViewController.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 27/02/21.
//

import UIKit
import RxCocoa
import RxSwift

/// Representation of a `Story Detail` screen.
final class StoryDetailViewController: UIViewController {
    // MARK: - Properties
    /// The details view containing a story's basic information.
    @AutoLayout private var detailView: StoryDetailView

    private let disposeBag: DisposeBag = DisposeBag()

    private let storyViewModel: StoryViewModelProtocol

    // MARK: - Init
    /// Initializes a new instance of this type.
    init(storyViewModel: StoryViewModelProtocol) {
        self.storyViewModel = storyViewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false

        setUp()
    }

    // MARK: - Views setup
    private func setUpDetailViewBindings() {
        detailView.setUp(with: storyViewModel)
    }

    private func setUpCommentsTableViewBindings() {

    }

    // MARK: - Layout
    private func setUp() {
        addViews()
        layoutConstraints()
        setUpDetailViewBindings()
        setUpCommentsTableViewBindings()
    }

    private func addViews() {
        view.addSubview(detailView)
    }

    /// Bundles all views' `layoutConstraints` function.
    private func layoutConstraints() {
        layoutDetailView()
    }

    private func layoutDetailView() {
        let guides = self.view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            detailView.leftAnchor.constraint(equalTo: guides.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: guides.rightAnchor),
            detailView.topAnchor.constraint(equalTo: guides.topAnchor)
        ])
    }
}
