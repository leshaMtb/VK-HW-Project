//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Apple on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
        let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
    }
    

    override func viewDidLayoutSubviews() {
        super .viewDidLayoutSubviews()
        
        profileHeaderView.frame = CGRect(
            x: view.safeAreaInsets.left,
            y: view.safeAreaInsets.top,
            width: view.bounds.width - view.safeAreaInsets.left - view.safeAreaInsets.right,
            height: view.frame.height)

    }
    
}


