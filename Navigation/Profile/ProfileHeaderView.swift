//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Apple on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {
 
        //аватарка собаки
    let profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.contentMode = .scaleAspectFit
        profileImage.image = #imageLiteral(resourceName: "dog")
        profileImage.clipsToBounds = true
    
        profileImage.layer.cornerRadius = 50
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        return profileImage
    }()
    
       //лейбл для статуса
    let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLabel.textAlignment = .left
        statusLabel.textColor = .gray
        statusLabel.text = "Im good boy..."
    
        return statusLabel
    }()
    
      //кнопка
    let button: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        button.layer.cornerRadius = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        return button
    }()
    
    
    // лейбл сверху
    let userNamelabel: UILabel = {
        let userNameLabel = UILabel()
        userNameLabel.font = UIFont.systemFont(ofSize: CGFloat(18), weight: .bold)
        userNameLabel.textAlignment = .left
        userNameLabel.textColor = .black
        userNameLabel.text = "Junior Dog"
        
        return userNameLabel
    }()
    
    //textfield
    let textFieldForStatus: UITextField = {
        let textFieldForStatus = UITextField()
        textFieldForStatus.placeholder = "Set status:"
        textFieldForStatus.backgroundColor = .white
        textFieldForStatus.addTarget(self, action: #selector(changeTextField), for: .editingChanged)
        textFieldForStatus.leftView  = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textFieldForStatus.frame.height))
        textFieldForStatus.leftViewMode = .always
        
        textFieldForStatus.layer.cornerRadius = 12
        textFieldForStatus.layer.borderWidth = 1
        textFieldForStatus.layer.borderColor = UIColor.black.cgColor
        
        return textFieldForStatus
    }()
    
   private let defaultInset = 16
    
    override func layoutSubviews() {
        
        //фрейм для аватарки
        profileImage.frame = CGRect(
            x: CGFloat(defaultInset),
            y: CGFloat(defaultInset) ,
            width: CGFloat(100),
            height: CGFloat(100))
        
        //фрейм для лейбла юзернэймлэйбл
        userNamelabel.frame = CGRect(
            x: profileImage.frame.maxX + CGFloat(defaultInset),
            y: CGFloat(27),
            width: CGFloat(self.frame.width - profileImage.frame.width - CGFloat(defaultInset * 3)),
            height: CGFloat(18))
        
        //фрейм для статуса
        statusLabel.frame = CGRect(
            x: CGFloat(profileImage.frame.maxX + CGFloat(defaultInset)),
            y: CGFloat(profileImage.frame.maxY - CGFloat(defaultInset * 2)),
            width: self.frame.width - profileImage.frame.width - CGFloat(defaultInset * 3),
            height: CGFloat(14))
        
        //текстфилд
        textFieldForStatus.frame = CGRect(
            x: CGFloat(profileImage.frame.width + CGFloat(defaultInset * 2)),
            y: CGFloat(statusLabel.frame.maxY + CGFloat(defaultInset)),
            width: self.frame.width - profileImage.frame.width - CGFloat(defaultInset * 3),
            height: CGFloat(40))
        
        //для кнопки
        button.frame = CGRect(
            x: CGFloat(defaultInset),
            y: CGFloat(textFieldForStatus.frame.maxY + CGFloat(defaultInset)),
            width: CGFloat(self.frame.width - CGFloat(defaultInset * 2)),
            height: CGFloat(50))
        
    }

    public override init(frame: CGRect) {
        super.init(frame: CGRect())
        
        backgroundColor = .lightGray

        //добавление на экран
        addSubview(profileImage)
        addSubview(button)
        addSubview(userNamelabel)
        addSubview(statusLabel)
        addSubview(textFieldForStatus)
    }
    
    var boofer: String?
    
    @objc private func changeTextField() {
        if textFieldForStatus.text != nil {
            boofer = textFieldForStatus.text } else {
                boofer = ""
            }
    }
    
    @objc private func buttonPressed() {
        statusLabel.text = boofer
        textFieldForStatus.text = ""
        textFieldForStatus.endEditing(true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



