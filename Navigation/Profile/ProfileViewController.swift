//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Apple on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//


import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    let header = ProfileHeaderViewNew()
    
    let reuseId = "cellId"
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isUserInteractionEnabled = true
        tableView.register(ProfileHeaderViewNew.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderViewNew.self))
        return tableView
    }()
    
    var backgroundView1: UIView = {
        let backview = UIView()
        backview.translatesAutoresizingMaskIntoConstraints = false
        backview.backgroundColor = .white
        backview.alpha = 0
        return backview
    }()
    
    var rect: UIView = {
        let rect = UIView()
        rect.translatesAutoresizingMaskIntoConstraints = false
        rect.backgroundColor = .clear
        rect.alpha = 0
        return rect
    }()
    
    
    var cancelButton: UIButton = {
        let cancelButton = UIButton(type: .close)
        cancelButton.alpha = 0
        cancelButton.isEnabled = true
        cancelButton.isUserInteractionEnabled = true
        return cancelButton
    }()
    
    @objc func tap() {
        
        // анимирую прозрачность своих двух вьюх
        let opacityBackgroundAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.backgroundView1.alpha = 0.5
            self.rect.alpha = 1
        }
        
        
        //здесь у мненя аватар едет на центр экрана,меняет cornerRadius на 0 и увеличивается
        let profileImageAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            
            self.rect.addSubview(self.header.profileImage)
            
            self.header.profileImage.frame = .init(
                x: 0,
                y: UIScreen.main.bounds.height / 2 - self.view.bounds.width / 2,
                width: self.view.bounds.width,
                height: self.view.bounds.width)
            
            self.header.profileImage.layer.cornerRadius = 0
            self.header.profileImage.layer.borderWidth = 0
        }
        
        let opacityButtonAnimation = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) {
            self.cancelButton.alpha = 1
        }
        
        opacityBackgroundAnimation.startAnimation()
        profileImageAnimation.startAnimation()
        opacityButtonAnimation.startAnimation(afterDelay: 0.5)
    }
    
    @objc func cancel() {
        
        let opacityButtonAnimation = UIViewPropertyAnimator(duration: 0.3, curve: .easeInOut) {
            self.cancelButton.alpha = 0
        }
        
        let profileImageAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.header.addSubview(self.header.profileImage)
            self.header.profileImage.frame = .init(x: 16, y: 16, width: 100, height: 100)
            self.header.profileImage.layer.cornerRadius = 50
            self.header.profileImage.layer.borderWidth = 3
            self.header.profileImage.layer.borderColor = UIColor.white.cgColor
        }
        
        let opacityBackgroundAnimation = UIViewPropertyAnimator(duration: 0.5, curve: .easeInOut) {
            self.backgroundView1.alpha = 0
            self.rect.alpha = 0
        }
        
        opacityButtonAnimation.startAnimation()
        profileImageAnimation.startAnimation(afterDelay: 0)
        opacityBackgroundAnimation.startAnimation(afterDelay: 0)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //animation
        self.header.addSubview(self.backgroundView1)
        self.backgroundView1.frame = .init(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.header.addSubview(self.rect)
        self.rect.frame = backgroundView1.frame
        
        self.rect.addSubview(self.cancelButton)
        self.cancelButton.frame = .init(x: self.view.frame.width - 20, y: 0, width: 20, height: 20)
        
        tableView.showsVerticalScrollIndicator = false
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(0)),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: CGFloat(0)),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: CGFloat(0)),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: CGFloat(0))
        ])
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: reuseId)
        
        tableView.register(ProfileHeaderViewNew.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderViewNew.self))
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: String(describing: PhotosTableViewCell.self))
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return StorageService.Storage.arrayOfPosts.count
        default:
            break
        }
        return section
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! PostTableViewCell
            cell.post = Storage.arrayOfPosts[indexPath.row]
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tap))
        header.profileImage.addGestureRecognizer(tapGest)
        
        let cancelGest = UITapGestureRecognizer(target: self, action: #selector(cancel))
        cancelButton.addGestureRecognizer(cancelGest)
        switch section {
        case 0:
            return header
        default:
            return nil
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 220
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            let photoViewController = PhotoViewController()
            navigationController?.pushViewController(photoViewController, animated: true)
        default:
            break
        }
    }
    
    
}
