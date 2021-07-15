//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Apple on 07.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class MainCoordinator {
    
    let tabBarController: TabBarController

    let factory1 = ControllerFactoryImpl()
    
    let publisher = Publisher()

    init() {
        tabBarController = TabBarController()

        
        let loginViewController = configLoginController()
        let feedCoordinator = configFeedCoordinator()
        let greenCoordinator = confinGreenCoordinator()

        
       tabBarController.viewControllers = [loginViewController,feedCoordinator.navigationController]

        loginViewController.tabBarItem = UITabBarItem.init(title: "Profile", image: UIImage(systemName: "person"), tag: 0)
        feedCoordinator.navigationController.tabBarItem = UITabBarItem.init(title: "Feed", image: UIImage(systemName: "house"), tag: 1)
        
        feedCoordinator.start()
        greenCoordinator.start1()

    }
    
    private func configLoginController() -> UINavigationController {
        let loginViewController1 = LogInViewController()
        let navigationForLogin = UINavigationController(rootViewController: loginViewController1)
        return navigationForLogin
    }
    
    private func configFeedCoordinator() -> FeedCoordinator {
        let navigationForFeed = UINavigationController()
        let coordinator = FeedCoordinator(navigation: navigationForFeed, factory: factory1)
        return coordinator
    }

    private func confinGreenCoordinator() -> GreenCoordinator {

        let navigationForGreen = UINavigationController()

        let coordinator = GreenCoordinator(navigation: navigationForGreen,
            factory: factory1
        )
        return coordinator
    }
}
