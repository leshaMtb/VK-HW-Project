//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Apple on 07.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class FeedCoordinator {

    private let factory: ControllerFactory

    let navigationController: UINavigationController

    private lazy var feedsModule = {
        factory.makeFeedViewModel()
    }()

    init(navigation: UINavigationController,
         factory: ControllerFactory) {
        self.navigationController = navigation
        self.factory = factory
    }

    func start() {
        navigationController.pushViewController(feedsModule.controller, animated: true)
    }
}
