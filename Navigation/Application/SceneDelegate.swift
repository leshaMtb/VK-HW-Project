//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    let publisher = Publisher()

    private let myLoginFactory = MyLoginFactory()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let rootTabBarController = RootTabBarController()
        window?.rootViewController = rootTabBarController

        let loginViewController = UINavigationController(rootViewController: LogInViewController())
        let feedViewController = UINavigationController(rootViewController: FeedViewController())

        loginViewController.tabBarItem = UITabBarItem.init(title: "Profile", image: UIImage(systemName: "person"), tag: 0)

        feedViewController.tabBarItem = UITabBarItem.init(title: "Feed", image: UIImage(systemName: "house"), tag: 1)

        window = UIWindow(windowScene: windowScene)

        guard let window = window else { return }
        window.rootViewController = rootTabBarController

        window.makeKeyAndVisible()

        rootTabBarController.viewControllers = [loginViewController,feedViewController]

        guard let navigationController = rootTabBarController.viewControllers?.first as? UINavigationController,
              let loginViewController1 = navigationController.viewControllers.first as? LogInViewController else { fatalError()}
        loginViewController1.delegate1 = myLoginFactory.setLoginInspector()



        guard let navigationcontroller1 = rootTabBarController.viewControllers?.last as? UINavigationController,
              let feedController = navigationcontroller1.viewControllers.first as? FeedViewController else { fatalError()}
        feedController.publisher = publisher

    }




    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

