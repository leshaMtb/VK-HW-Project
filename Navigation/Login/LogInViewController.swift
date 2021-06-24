//
//  TestViewController.swift
//  Navigation
//
//  Created by Apple on 01.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//
//
//  TestViewController.swift
//  Navigation
//
//  Created by Apple on 01.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    var delegate1: LoginViewControllerDelegate?

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let viewOnScroll: UIView = {
        let viewOnScroll = UIView()
        viewOnScroll.translatesAutoresizingMaskIntoConstraints = false
        return viewOnScroll
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "logo")
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let bigViewForLogIn: UIView = {
        let bigViewForLogIn = UIView()
        bigViewForLogIn.backgroundColor = .systemGray6
        bigViewForLogIn.layer.cornerRadius = 10
        bigViewForLogIn.layer.borderWidth = 0.5
        bigViewForLogIn.layer.borderColor = UIColor.lightGray.cgColor
        bigViewForLogIn.translatesAutoresizingMaskIntoConstraints = false
        return bigViewForLogIn
    }()

    private let separatorViewForLogin: UIView = {
        let separatorViewForLogin = UIView()
        separatorViewForLogin.backgroundColor = .lightGray
        separatorViewForLogin.translatesAutoresizingMaskIntoConstraints = false
        return separatorViewForLogin
    }()

    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.textColor = .black
        emailTextField.font = UIFont.systemFont(ofSize: CGFloat(16))
        emailTextField.placeholder = "E-mail / Phone number"
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        return emailTextField
    }()

    private let passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: CGFloat(16))
        passwordTextField.placeholder = "Password"
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        return passwordTextField
    }()

    private let logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.setBackgroundImage(#imageLiteral(resourceName: "blue_pixel"), for: .normal)
        logInButton.setTitleColor(.gray, for: .selected)
        logInButton.setTitle("Log in", for: .normal)
        logInButton.clipsToBounds = true
        logInButton.layer.cornerRadius = 10
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        return logInButton
    }()



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

            // scroll.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            //scrollView.contentOffset = CGPoint(x: 0, y: keyboardSize.height)
            scrollView.contentInset.bottom = keyboardSize.height
        }
    }

    @objc fileprivate func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    override func viewDidLoad() {
        super .viewDidLoad()

       // self.delegate1 = LoginInspector()

        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(viewOnScroll)
        viewOnScroll.addSubview(imageView)
        viewOnScroll.addSubview(bigViewForLogIn)
        viewOnScroll.addSubview(separatorViewForLogin)
        viewOnScroll.addSubview(emailTextField)
        viewOnScroll.addSubview(passwordTextField)
        viewOnScroll.addSubview(logInButton)
        logInButton.addTarget(self, action: #selector(showProfileViewController), for: .touchUpInside)
        let defaultInset = 16

        //активирую констрейнт лэйоут
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            viewOnScroll.topAnchor.constraint(equalTo: scrollView.topAnchor),
            viewOnScroll.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            viewOnScroll.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            viewOnScroll.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            viewOnScroll.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            imageView.topAnchor.constraint(equalTo: viewOnScroll.topAnchor, constant: CGFloat(120)),
            imageView.centerXAnchor.constraint(equalTo: viewOnScroll.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: CGFloat(100)),
            imageView.heightAnchor.constraint(equalToConstant: CGFloat(100)),

            bigViewForLogIn.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: CGFloat(120)),
            bigViewForLogIn.heightAnchor.constraint(equalToConstant: CGFloat(100)),
            bigViewForLogIn.rightAnchor.constraint(equalTo: viewOnScroll.rightAnchor, constant: CGFloat(-defaultInset)),
            bigViewForLogIn.leftAnchor.constraint(equalTo: viewOnScroll.leftAnchor, constant: CGFloat(defaultInset)),

            separatorViewForLogin.topAnchor.constraint(equalTo: bigViewForLogIn.topAnchor, constant: CGFloat(50)),
            separatorViewForLogin.heightAnchor.constraint(equalToConstant: CGFloat(0.5)),
            separatorViewForLogin.rightAnchor.constraint(equalTo: viewOnScroll.rightAnchor, constant: CGFloat(-16)),
            separatorViewForLogin.leftAnchor.constraint(equalTo: viewOnScroll.leftAnchor, constant: CGFloat(defaultInset)),

            emailTextField.topAnchor.constraint(equalTo: bigViewForLogIn.topAnchor, constant: CGFloat(17)),
            emailTextField.leftAnchor.constraint(equalTo: viewOnScroll.leftAnchor, constant: CGFloat(defaultInset + 10)),
            emailTextField.rightAnchor.constraint(equalTo: viewOnScroll.rightAnchor, constant: CGFloat(-26)),
            emailTextField.heightAnchor.constraint(equalToConstant: CGFloat(defaultInset)),

            passwordTextField.topAnchor.constraint(equalTo: bigViewForLogIn.topAnchor, constant: CGFloat(67)),
            passwordTextField.leftAnchor.constraint(equalTo: viewOnScroll.leftAnchor, constant: CGFloat(defaultInset + 10)),
            passwordTextField.rightAnchor.constraint(equalTo: viewOnScroll.rightAnchor, constant: CGFloat(-26)),
            passwordTextField.heightAnchor.constraint(equalToConstant: CGFloat(defaultInset)),

            logInButton.topAnchor.constraint(equalTo: bigViewForLogIn.bottomAnchor, constant: CGFloat(defaultInset)),
            logInButton.heightAnchor.constraint(equalToConstant: CGFloat(50)),
            logInButton.leftAnchor.constraint(equalTo: viewOnScroll.leftAnchor, constant: CGFloat(defaultInset)),
            logInButton.rightAnchor.constraint(equalTo: viewOnScroll.rightAnchor, constant: CGFloat(-defaultInset)),
            logInButton.bottomAnchor.constraint(equalTo: viewOnScroll.bottomAnchor)
        ])
    }
/*
    @objc private func showProfileViewController() {
        
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
        let testUser = TestUserService()
        let currentUser = CurrentUserService()
        guard let loginText = emailTextField.text else { return }
        #if DEBUG
        let profileVC = ProfileViewController(userService: testUser, user: loginText)
        #else
        let profileVC = ProfileViewController(userService: currentUser, user: loginText)
        #endif
        show(profileVC, sender: (Any).self)
    }*/


    @objc private func showProfileViewController() {

        print("ДАННЫЕ ВВЕДЕНЫ ПРАВИЛЬНО?")
        print(self.delegate1?.check(parameter: emailTextField.text!.hash + passwordTextField.text!.hash) as Any)
        
        if self.delegate1?.check(parameter: emailTextField.text!.hash + passwordTextField.text!.hash) == true {
            print("тут логика открытия контроллера")
/*
            emailTextField.endEditing(true)
            passwordTextField.endEditing(true)

            let testUser = TestUserService()
            let currentUser = CurrentUserService()
            guard let loginText = emailTextField.text else { return }
            #if DEBUG
            let profileVC = ProfileViewController(userService: testUser, user: loginText)
            #else
            let profileVC = ProfileViewController(userService: currentUser, user: loginText)
            #endif
            show(profileVC, sender: (Any).self)
*/
        } else {
            print("тут обработка ошибочного ввода логиня или пароля на экране ERROR")
        }

      //  emailTextField.endEditing(true)
      //  passwordTextField.endEditing(true)

      //  let storybord = UIStoryboard(name: "Main", bundle: nil)
       // let vc = storybord.instantiateViewController(withIdentifier: "profile")
       // show(vc, sender: (Any).self)
    }


}


//add checker sungletone
class Checker {
    //чекер это синглтон
    static let checker = Checker()

    private let loginHash = "Aleksey".hash
    private let passwordHash = "12345".hash

    func checkLoginPassword(parameter: Int) -> Bool {
        if parameter == loginHash + passwordHash {
            print("-Данные введены корректно✌")
            return true
        } else {
            print("-Данные введены некорректно🗿")
            return false
        }
    }
}


//add protocol and logininspector

protocol LoginViewControllerDelegate: class {
    func check(parameter: Int )-> Bool
}

class LoginInspector: LoginViewControllerDelegate {
    func check(parameter: Int) -> Bool {
        print("ВЫПОЛНЯЕТСЯ ДЕЛЕГАТ,РАБОТАЕТ ЛОГИНИНСПЕКТОР,ЗВОНИМ В ЧЕКЕР КОТОРЫЙ СИНГЛТОН,ВСЕМ ЛЕЖАТЬ")
        return Checker.checker.checkLoginPassword(parameter: parameter)
    }


}
