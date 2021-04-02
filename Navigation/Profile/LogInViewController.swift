//
//  TestViewController.swift
//  Navigation
//
//  Created by Apple on 01.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
  
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.contentInset.bottom = 100
        return scrollView
    }()
    
    private let viewOnScroll = UIView()

    private let imageView: UIImageView = {
     let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "logo")
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let bigViewForLogIn: UIView = {
        let bigViewForLogIn = UIView()
        bigViewForLogIn.backgroundColor = .systemGray6
        bigViewForLogIn.layer.cornerRadius = 10
        bigViewForLogIn.layer.borderWidth = 0.5
        bigViewForLogIn.layer.borderColor = UIColor.lightGray.cgColor
        
        return bigViewForLogIn
    }()
    
    private let separatorViewForLogin: UIView = {
        let separatorViewForLogin = UIView()
        separatorViewForLogin.backgroundColor = .lightGray
        
        return separatorViewForLogin
    }()
    
    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: CGFloat(16))
        emailTextField.placeholder = "E-mail / Phone number"
        
        return emailTextField
    }()
    
    private let passwordTextField: UITextField = {
       
        let passwordTextField = UITextField()
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: CGFloat(16))
        passwordTextField.placeholder = "Password"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private let logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        logInButton.setTitleColor(.gray, for: .selected)
        logInButton.setTitle("Log in", for: .normal)
        logInButton.clipsToBounds = true
        logInButton.layer.cornerRadius = 10
        
        
        return logInButton
    }()
    
    override func viewDidLoad() {
        super .viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        
        //тут добавляю сабвью
        view.addSubview(scrollView)
        scrollView.addSubview(viewOnScroll)
        viewOnScroll.addSubview(imageView)
        viewOnScroll.addSubview(bigViewForLogIn)
        viewOnScroll.addSubview(separatorViewForLogin)
        viewOnScroll.addSubview(emailTextField)
        viewOnScroll.addSubview(passwordTextField)
        viewOnScroll.addSubview(logInButton)
        logInButton.addTarget(self, action: #selector(showProfileViewController), for: .touchUpInside)
    }
    
    @objc private func showProfileViewController() {
        
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
       let storybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = storybord.instantiateViewController(withIdentifier: "profile")
        show(vc, sender: (Any).self)
    }
    
    
    // MARK: Keyboard notifications это скопированный блок кода
    //---------------------------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // MARK: Actions
    @objc fileprivate func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            
           // scrollView.contentInset.bottom = keyboardSize.height
          //  scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            scrollView.contentOffset = CGPoint(x: 0, y: keyboardSize.height)
        }
    }
    
    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
      //  scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
//---------------------------------------------------------------------------------
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.frame
        viewOnScroll.frame = scrollView.frame
        
       let defaultInset = 16
        
        imageView.frame = CGRect(
            x: CGFloat(viewOnScroll.frame.width / 2 - 50),
            y: CGFloat(120),
            width: CGFloat(100),
            height: CGFloat(100))
        
        bigViewForLogIn.frame = CGRect(
            x: CGFloat(defaultInset),
            y: CGFloat(imageView.frame.maxY + 120),
            width: CGFloat(viewOnScroll.frame.width - 32),
            height: CGFloat(100))
        
        separatorViewForLogin.frame = CGRect(
            x: CGFloat(defaultInset),
            y: CGFloat(bigViewForLogIn.frame.midY),
            width: CGFloat(viewOnScroll.frame.width - CGFloat(defaultInset * 2)),
            height: CGFloat(0.5))
        
        emailTextField.frame = CGRect(
            x: CGFloat(defaultInset + 10),
            y: CGFloat(bigViewForLogIn.frame.minY + 17),
            width: CGFloat(bigViewForLogIn.frame.width - 20),
            height: CGFloat(defaultInset))
        
        
       passwordTextField.frame = CGRect (
            x: CGFloat(defaultInset + 10),
        y: CGFloat(separatorViewForLogin.frame.maxY + 17),
            width: CGFloat(emailTextField.frame.width),
            height: CGFloat(defaultInset))
         
        
        logInButton.frame = CGRect(
            x: CGFloat(defaultInset),
            y: CGFloat(bigViewForLogIn.frame.maxY + CGFloat(defaultInset)),
            width: CGFloat(bigViewForLogIn.frame.width),
            height: CGFloat(50))
        
      }
}




