//
//  ProfileHeaderViewNew.swift
//  Navigation
//
//  Created by Apple on 08.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderViewNew: UITableViewHeaderFooterView {
    
    var profileHeaderView: UIView! = {
        let headerView = UIView()
        headerView.backgroundColor = .init(white: 0.95, alpha: 1.0)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    lazy var profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = #imageLiteral(resourceName: " Аватарочка-1")
        profileImage.layer.cornerRadius = 50
        profileImage.layer.borderColor = UIColor.white.cgColor
        profileImage.layer.borderWidth = 3
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFill
        //
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        return profileImage
    }()
    
    var profileFullName: UILabel = {
        let profileTitle = UILabel()
        profileTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        profileTitle.textColor = .black
        profileTitle.text = "Shirokov Aleksey"
        profileTitle.translatesAutoresizingMaskIntoConstraints = false
        return profileTitle
    }()
    
    var status: UILabel = {
        let status = UILabel()
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.textColor = .gray
        status.translatesAutoresizingMaskIntoConstraints = false
        status.text = "Junior in future"
        return status
    }()
    
    var statusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Set status:"
        textField.layer.cornerRadius = 12
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = .white
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(statusTextChanged(_:)), for: .editingChanged)
        
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    var statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    //буфер для текстфилда
    private var statusText: String?
    
    @objc func buttonPressed() {
        print("\(status.text!)")
        if let statusText = statusText {
            status.text = statusText
        }
        statusTextField.endEditing(true)
        statusTextField.text = ""
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(profileHeaderView)
        profileHeaderView.addSubview(profileImage)
        profileHeaderView.addSubview(profileFullName)
        profileHeaderView.addSubview(status)
        profileHeaderView.addSubview(statusTextField)
        profileHeaderView.addSubview(statusButton)
        
        NSLayoutConstraint.activate([
            
            profileHeaderView.topAnchor.constraint(equalTo: contentView.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            profileImage.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            
            profileFullName.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 27),
            profileFullName.heightAnchor.constraint(equalToConstant: 30),
            profileFullName.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 132),
            profileFullName.widthAnchor.constraint(equalToConstant: 180),
            
            status.topAnchor.constraint(equalTo: profileFullName.bottomAnchor, constant: 25),
            status.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 16),
            status.rightAnchor.constraint(equalTo: profileHeaderView.rightAnchor, constant: -16),
            status.heightAnchor.constraint(equalToConstant: 14),
            
            statusTextField.topAnchor.constraint(equalTo: status.bottomAnchor, constant: 10),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 16),
            statusTextField.rightAnchor.constraint(equalTo: profileHeaderView.rightAnchor, constant: -16),
            
            statusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: profileHeaderView.rightAnchor, constant: -16),
            statusButton.leftAnchor.constraint(equalTo: profileHeaderView.leftAnchor, constant: 16),
            statusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
