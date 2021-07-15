//
//  GreenCoordinator.swift
//  Navigation
//
//  Created by Apple on 13.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation


import UIKit

class GreenCoordinator {

    private let factory: ControllerFactory

    let navigationController: UINavigationController


    private lazy var greenModule = {
        factory.makeGreenViewModel()
    }()

    init(navigation: UINavigationController,
         factory: ControllerFactory) {
        self.navigationController = navigation
        self.factory = factory
    }

    func start1() {
        navigationController.pushViewController(greenModule.controller, animated: true)

        greenModule.viewModel.toRoot = {
            self.navigationController.popToRootViewController(animated: true)
        }
    }
}
 
