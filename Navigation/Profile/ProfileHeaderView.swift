//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Apple on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var fullName: UILabel! {
        didSet {
            fullName.font = UIFont.systemFont(ofSize: CGFloat(18), weight: .bold)
            fullName.textAlignment = .left
            fullName.textColor = .black
            fullName.text = "Shirokov Aleksey"
            fullName.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var statusLabel1: UILabel! {
        didSet {
            statusLabel1.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            statusLabel1.textAlignment = .left
            statusLabel1.textColor = .gray
            statusLabel1.text = "Junior in future"
            statusLabel1.backgroundColor = .clear
        }
    }
    
    @IBOutlet weak var statusTextField: UITextField! {
        didSet {
            statusTextField.placeholder = "Set status:"
            statusTextField.leftView  = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
            statusTextField.leftViewMode = .always
            statusTextField.backgroundColor = .white
            statusTextField.layer.cornerRadius = 12
            statusTextField.clipsToBounds = true
            statusTextField.backgroundColor = .white
            statusTextField.layer.borderWidth = 1
            statusTextField.layer.borderColor = UIColor.black.cgColor
        }
        
    }
    
    @IBOutlet weak var setStatusButton: UIButton! {
        didSet {
            setStatusButton.setTitle("Show status", for: .normal)
            setStatusButton.tintColor = .white
            setStatusButton.backgroundColor = .systemBlue
            setStatusButton.layer.cornerRadius = 4
            setStatusButton.layer.shadowRadius = 4
            setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
            setStatusButton.layer.shadowColor = UIColor.black.cgColor
            setStatusButton.layer.shadowOpacity = 0.7
        }
    }
    
    @IBOutlet weak var avatarImageView: UIImageView! {
        didSet {
            avatarImageView.contentMode = .scaleAspectFill
            avatarImageView.image = #imageLiteral(resourceName: " Аватарочка-1")
            avatarImageView.clipsToBounds = true
        
            avatarImageView.layer.cornerRadius = 50
            avatarImageView.layer.borderWidth = 3
            avatarImageView.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBAction func statusTextFieldAction (sender: UITextField) {
        print( statusTextField.text!)
    }
    
    @IBAction func buttonAction (sender: UIButton) {
        
        if statusTextField.text != nil {
            statusLabel1.text = statusTextField.text
        }
        
        statusTextField.endEditing(true)
        statusTextField.text = ""
    }
    
    

    
    override func layoutSubviews() {
        super .layoutSubviews()
        
       self.backgroundColor = .lightGray
     
    }
    
  
}



