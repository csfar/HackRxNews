//
//  Coordinator.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 08/12/20.
//

import UIKit

/// Base  Coordinator.
protocol Coordinator {
    /// The  Coordinator's `UINavigationController`.
    var navigationController: UINavigationController { get set }

    /// Starts the Coordinator's flow.
    func start()
}
