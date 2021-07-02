//
//  CustomButton.swift
//  Navigation
//
//  Created by Apple on 30.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class CustomButton: UIButton {
    
    var closureInButtonActionFunc: (() -> Void)?

    init(
        titleText title: String,
        titleColor color: UIColor,
        backgroundColor bgColor: UIColor,
        tapAction: (() -> Void)?
    ) {
        self.closureInButtonActionFunc = tapAction
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
        backgroundColor = bgColor
        addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        translatesAutoresizingMaskIntoConstraints = false
    }

    @objc private func buttonAction() {
        closureInButtonActionFunc?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

