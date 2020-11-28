//
//  TopStoriesViewController.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 27/11/20.
//

import UIKit

/// Representation of the `Top Stories` section.
final class TopStoriesViewController: UIViewController {
    // MARK: - Properties
    /// The `UITableView` used to display the stories.
    @AutoLayout private var storiesTableView: UITableView

    // MARK: - Init
    /// Initializes a new instance of this type.
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        layoutConstraints()
    }

    // MARK: - Views setup
    /// Bundles all views' `setUp` function.
    private func setUpViews() {
        setUpTableView()
    }

    private func setUpTableView() {
        storiesTableView.delegate = self
        storiesTableView.dataSource = self
        storiesTableView.register(TopStoriesTableViewCell.self,
                                  forCellReuseIdentifier: TopStoriesTableViewCell.identifier)

        storiesTableView.rowHeight = UITableView.automaticDimension
        storiesTableView.estimatedRowHeight = 100
    }

    // MARK: - Layout
    /// Bundles all views' `layoutConstraints` function.
    private func layoutConstraints() {
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

// MARK: - UITableViewDelegate
extension TopStoriesViewController: UITableViewDelegate {

}

// MARK: - UITableViewDataSource
extension TopStoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =
                tableView.dequeueReusableCell(withIdentifier: TopStoriesTableViewCell.identifier)
                as? TopStoriesTableViewCell else {
            return UITableViewCell()
        }

        let story = TopStoryViewModel(title: "Show HN: HackRxNews",
                                      author: "by janejohn",
                                      dateOfPosting: "8 hours ago",
                                      numberOfComments: "81 comments",
                                      points: "999")
        cell.setUp(with: story)
        return cell
    }

}
