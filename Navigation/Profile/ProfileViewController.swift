//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Apple on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var newButton: UIButton  = {
        let newButton = UIButton()
        newButton.setTitle("Tap Me", for: .normal)
        newButton.setTitleColor(.init(white: CGFloat(1), alpha: CGFloat(0.6)), for: .highlighted)
        newButton.backgroundColor = .systemBlue
        
        return newButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray
        self.view.addSubview(newButton)
       // navigationController?.navigationBar.isHidden = false
        self.newButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            self.newButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.newButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat(0)),
            self.newButton.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: CGFloat(0)),
            self.newButton.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: CGFloat(0))
        ])
    }
    
    
}


