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
    @AutoLayout private var storiesTableView: TopStoriesTableView

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
    override func loadView() {
        view = storiesTableView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Top Stories"

        setUpTableViewBindings()
    }

    // MARK: - Views setup
    /// Sets up the `storiesTableView`'s bindings.
    private func setUpTableViewBindings() {
        viewModel.stories
            .drive(storiesTableView
                    .rx
                    .items(cellIdentifier: TopStoriesTableViewCell.identifier,
                                             cellType: TopStoriesTableViewCell.self)) { (_, viewModel, cell) in
                cell.setUp(with: viewModel)
            }.disposed(by: disposeBag)
    }
}
