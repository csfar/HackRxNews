//
//  FeedCoordinator.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 08/12/20.
//

import UIKit

/// The Coordinator responsible for the `Feed` screen flow.
final class FeedCoordinator: Coordinator {

    /// The manager responsible network calls.
    private let networkManager: NetworkManager

    /// The Coordinator's `UINavigationController`.
    var navigationController: UINavigationController

    /// Initializes a new instance of this type.
    /// - Parameter navigationController: The Coordinator's `UINavigationController`.
    /// - Parameter networkManager: The manager responsible network calls.
    init(navigationController: UINavigationController,
         networkManager: NetworkManager) {
        self.navigationController = navigationController
        self.networkManager = networkManager
    }

    /// Starts the Coordinator's flow.
    func start() {
        let viewModel = TopStoriesViewModel(networkManager: self.networkManager, coordinator: self)
        let viewController = TopStoriesViewController(viewModel: viewModel)

        navigationController.pushViewController(viewController, animated: true)
    }
}
