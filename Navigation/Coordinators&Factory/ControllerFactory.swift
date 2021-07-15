//
//  ControllerFactory.swift
//  Navigation
//
//  Created by Apple on 07.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit


protocol ControllerFactory {
    func makeFeedViewModel() -> (viewModel: FeedViewModel, controller: FeedViewController)
    func makeGreenViewModel() -> (viewModel: GreenViewModel, controller: GreenViewController)

}

struct ControllerFactoryImpl: ControllerFactory {

    let publisher = Publisher()
    
    func makeFeedViewModel() -> (viewModel: FeedViewModel, controller: FeedViewController) {
        let viewModel = FeedViewModel()
        viewModel.publisher = publisher
        let feedViewController = FeedViewController(viewModel: viewModel)
        return (viewModel,feedViewController)
    }

    func makeGreenViewModel() -> (viewModel: GreenViewModel , controller: GreenViewController) {
        let viewModel = GreenViewModel()
        let greenViewController = GreenViewController(viewModel: viewModel)
        return (viewModel,greenViewController)
    }
}
