//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Apple on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
      // print( self.navigationController?.navigationBar.frame.height)
      
    }
    

    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
      
  
        let profileHeaderView = ProfileHeaderView()

        profileHeaderView.frame = CGRect(x: 0,
                                         y: view.safeAreaInsets.top,
                                         width: view.frame.width,
                                         height: view.frame.height - view.safeAreaInsets.top - (navigationController?.navigationBar.frame.height)! )
        

        view.addSubview(profileHeaderView)
        
        
        
        
        
    //  print(view.safeAreaInsets.top)

    }
    
}


