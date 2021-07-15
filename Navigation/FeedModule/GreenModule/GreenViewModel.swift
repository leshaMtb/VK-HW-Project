//
//  GreenViewModel.swift
//  Navigation
//
//  Created by Apple on 13.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol GreenViewOutout {
    var callFromViewToModel: () -> Void { get set }
}

class GreenViewModel: GreenViewOutout {

    var toRoot: (() -> Void)?

    lazy var callFromViewToModel: () -> Void = { [weak self] in
        self?.toRoot?()
    }
}
