//
//  FeedCoordinator.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 08/12/20.
//

import UIKit

/// The Coordinator responsible for the `Feed` screen flow.
final class FeedCoordinator: Coordinator {

    /// The Coordinator's `UINavigationController`.
    var navigationController: UINavigationController

    /// Initializes a new instance of this type.
    /// - Parameter navigationController: The Coordinator's `UINavigationController`.
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    /// Starts the Coordinator's flow.
    func start() {
        let viewModel = TopStoriesViewModel(coordinator: self)
        let viewController = TopStoriesViewController(viewModel: viewModel)

        navigationController.pushViewController(viewController, animated: true)
    }
}
