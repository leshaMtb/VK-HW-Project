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
        let pi = UIImageView()
        pi.contentMode = .scaleAspectFit
        pi.image = #imageLiteral(resourceName: "dog")
        pi.clipsToBounds = true
    
        return pi
    }()
    
       //лейбл для статуса
    let statusLabel: UILabel = {
        let sl = UILabel()
        sl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        sl.textAlignment = .left
        sl.textColor = .gray
        sl.text = "Im good boy..."
    
        return sl
    }()
    
      //кнопка
    let button: UIButton = {
        let bttn = UIButton()
        bttn.setTitle("Show status", for: .normal)
        bttn.tintColor = .white
        bttn.backgroundColor = .systemBlue
        bttn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return bttn
    }()
    
    
    // лейбл сверху
    let userNamelabel: UILabel = {
        let unl = UILabel()
        unl.font = UIFont.systemFont(ofSize: CGFloat(18), weight: .bold)
        unl.textAlignment = .left
        unl.textColor = .black
        unl.text = "Senior Dog"
       
        return unl
    }()
    
    //textfield
    let textFieldForStatus: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Set status:"
        txt.backgroundColor = .white
        txt.addTarget(self, action: #selector(changeTextField), for: .editingChanged)
        txt.leftView  = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: txt.frame.height))
        txt.leftViewMode = .always
        return txt
    }()
        
                                                     

    public override init(frame: CGRect) {
        super.init(frame: CGRect())
        
        backgroundColor = .lightGray
     
        //ФРЕЙМЫ:
        
        //фрейм для аватарки
        profileImage.frame = CGRect(
            x: CGFloat(16),
            y: CGFloat(16) ,
            width: CGFloat(100),
            height: CGFloat(100))
        
        //фрейм для лейбла юзернэймлэйбл
        userNamelabel.frame = CGRect(
            x: CGFloat(profileImage.frame.maxX + 16),
            y: CGFloat(27),
            width: CGFloat(UIScreen.main.bounds.width - 32) - CGFloat(profileImage.frame.maxX + 16),
            height: CGFloat(18))
        
        //фрейм для статуса
        statusLabel.frame = CGRect(
            x: CGFloat(profileImage.frame.maxX + 16),
            y: CGFloat(profileImage.frame.maxY - 32),
            width: CGFloat(UIScreen.main.bounds.width - 32) - CGFloat(profileImage.frame.maxX + 16),
            height: CGFloat(14))
        
        //текстфилд
        textFieldForStatus.frame = CGRect(
            x: CGFloat(profileImage.frame.width + 32),
            y: CGFloat(statusLabel.frame.maxY + 16),
            width: CGFloat(UIScreen.main.bounds.width - profileImage.frame.width - 48),
            height: CGFloat(40))
        
        //для кнопки
        button.frame = CGRect(
            x: CGFloat(16),
            y: CGFloat(textFieldForStatus.frame.maxY + 16),
            width: CGFloat(UIScreen.main.bounds.width - 32),
            height: CGFloat(50))
        
        //работа с CALayer
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        profileImage.layer.borderWidth = 3
        profileImage.layer.borderColor = UIColor.white.cgColor
        
        button.layer.cornerRadius = 4
        button.layer.shadowRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        
        textFieldForStatus.layer.cornerRadius = 12
        textFieldForStatus.layer.borderWidth = 1
        textFieldForStatus.layer.borderColor = UIColor.black.cgColor
        
        
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



