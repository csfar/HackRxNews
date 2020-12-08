//
//  SceneDelegate.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 25/11/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)

        let navigationController = UINavigationController()
        let networkManager = NetworkManager()
        let coordinator = FeedCoordinator(navigationController: navigationController, networkManager: networkManager)

        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        coordinator.start()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}
