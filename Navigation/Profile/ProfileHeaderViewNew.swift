//
//  ProfileHeaderViewNew.swift
//  Navigation
//
//  Created by Apple on 08.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

class ProfileHeaderViewNew: UITableViewHeaderFooterView {
    
    var profileHeaderView: UIView! = {
        let headerView = UIView()
        //task1.2
        #if DEBUG
        headerView.backgroundColor = .systemPink
        #else
        headerView.backgroundColor = .init(white: 0.95, alpha: 1.0)
        #endif
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    lazy var profileImage: UIImageView = {
        let profileImage1 = UIImageView()
        profileImage1.isUserInteractionEnabled = true
        profileImage1.image = #imageLiteral(resourceName: " Аватарочка-1")
        profileImage1.layer.cornerRadius = 50
        profileImage1.layer.borderColor = UIColor.white.cgColor
        profileImage1.layer.borderWidth = 3
        profileImage1.clipsToBounds = true
        profileImage1.contentMode = .scaleAspectFill
        profileImage1.translatesAutoresizingMaskIntoConstraints = false
        return profileImage1
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

    private enum Constants {
    static let sideInset: CGFloat = 16.0
    }

    func setupViews() {
        
        contentView.addSubview(profileHeaderView)
        profileHeaderView.addSubview(profileImage)
        profileHeaderView.addSubview(profileFullName)
        profileHeaderView.addSubview(status)
        profileHeaderView.addSubview(statusTextField)
        profileHeaderView.addSubview(statusButton)
        
        profileHeaderView.snp.makeConstraints { profileHeaderView in
            profileHeaderView.left.right.top.equalToSuperview()
            profileHeaderView.height.equalTo(220)
        }

        profileImage.snp.makeConstraints { profileImage in
            profileImage.left.top.equalTo(Constants.sideInset)
            profileImage.height.width.equalTo(100)
        }

        profileFullName.snp.makeConstraints { profileFullName in
            profileFullName.top.equalTo(27)
            profileFullName.height.equalTo(30)
            profileFullName.left.equalTo(132)
            profileFullName.right.equalTo(-Constants.sideInset)
        }

        status.snp.makeConstraints { status in
            status.top.equalTo(profileFullName).inset(40)
            status.left.equalTo(132)
            status.right.equalTo(-Constants.sideInset)
            status.height.equalTo(40)
        }

        statusTextField.snp.makeConstraints { statusTextField in
            statusTextField.left.equalTo(132)
            statusTextField.right.equalTo(-Constants.sideInset)
            statusTextField.top.equalTo(status).inset(40)
            statusTextField.height.equalTo(40)
        }

        statusButton.snp.makeConstraints { statusButton in
            statusButton.top.equalTo(statusTextField).inset(55)
            statusButton.height.equalTo(50)
            statusButton.left.equalTo(Constants.sideInset)
            statusButton.right.equalTo(-Constants.sideInset)
        }
    }
}
