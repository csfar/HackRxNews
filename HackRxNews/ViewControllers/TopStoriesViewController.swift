//
//  TopStoriesViewController.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 27/11/20.
//

import UIKit
import RxCocoa
import RxSwift

/// Representation of the `Top Stories` section.
final class TopStoriesViewController: UIViewController {
    // MARK: - Properties
    /// The `UITableView` used to display the stories.
    @AutoLayout private var storiesTableView: UITableView

    /// The dispose bag used by this object.
    private let disposeBag: DisposeBag = DisposeBag()

    /// The `ViewModel` for this `View`.
    private let viewModel: TopStoriesViewModel

    // MARK: - Init
    /// Initializes a new instance of this type.
    /// - Parameter viewModel: The `ViewModel` responsible for this `View`.
    init(viewModel: TopStoriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Top Stories"

        setUpTableView()
        layoutTableViewConstraints()
    }

    // MARK: - Views setup
    /// Sets up the `storiesTableView`.
    private func setUpTableView() {
        storiesTableView.register(TopStoriesTableViewCell.self,
                                  forCellReuseIdentifier: TopStoriesTableViewCell.identifier)
        storiesTableView.rowHeight = UITableView.automaticDimension
        storiesTableView.estimatedRowHeight = 100

        viewModel.stories.bind(to: storiesTableView.rx.items(cellIdentifier: TopStoriesTableViewCell.identifier,
                                                             cellType: TopStoriesTableViewCell.self)) { (_, element, cell) in
            let viewModel = TopStoryViewModel(item: element)
            cell.setUp(with: viewModel)
        }.disposed(by: disposeBag)
    }

    // MARK: - Layout
    /// Bundles all views' `layoutConstraints` function.
    private func layoutTableViewConstraints() {
        view.addSubview(storiesTableView)

        let guide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            storiesTableView.centerYAnchor.constraint(equalTo: guide.centerYAnchor),
            storiesTableView.centerXAnchor.constraint(equalTo: guide.centerXAnchor),
            storiesTableView.widthAnchor.constraint(equalTo: guide.widthAnchor),
            storiesTableView.heightAnchor.constraint(equalTo: guide.heightAnchor)
        ])
    }
}
