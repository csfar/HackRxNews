//
//  TopStoriesTableView.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 02/12/20.
//

import UIKit

/// Representation of the top stories in the `Top Stories` screen.
final class TopStoriesTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Sets up the `UITableView`.
    private func setUp() {
        register(TopStoriesTableViewCell.self,
                                  forCellReuseIdentifier: TopStoriesTableViewCell.identifier)
        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 125
    }
}
