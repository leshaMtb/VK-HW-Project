//
//  CustomTextField.swift
//  Navigation
//
//  Created by Apple on 02.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class CustomTextField: UITextField {
    init(
        bgColor: UIColor,
        placeHolder: String,
        sizeOfText: CGFloat
    ) {
        super.init(frame: .zero)
        backgroundColor = bgColor
        placeholder = placeHolder
        font = UIFont.systemFont(ofSize: sizeOfText)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
