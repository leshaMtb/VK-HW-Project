//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Apple on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let header = ProfileHeaderViewNew()
    
    let reuseId = "cellId"
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isUserInteractionEnabled = true
        tableView.register(ProfileHeaderViewNew.self, forHeaderFooterViewReuseIdentifier: String(describing: ProfileHeaderViewNew.self))
        return tableView
    }()
    
    var backgroundView: UIView = {
        let translucent = UIView()
        translucent.translatesAutoresizingMaskIntoConstraints = false
        translucent.backgroundColor = UIColor.white.withAlphaComponent(0)
        return translucent
    }()
    
    var cancelButtonForAnimation: UIButton = {
        let cancelButton = UIButton(type: .close)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.alpha = 0
        return cancelButton
    }()
    
    //MARK:-  жесты
    let animationOpenProfileImage: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 2.0, curve: UIView.AnimationCurve.easeInOut)
    let animationCancelButton: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 2.0, curve: UIView.AnimationCurve.easeInOut)
    let animationCloseProfileImage: UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut)

    
    @objc func tap() {
        animationOpenProfileImage.startAnimation()
        animationCancelButton.startAnimation()
        }

    
    @objc func cancel() {
        
        if animationCancelButton.isRunning == true && animationOpenProfileImage.isRunning == true {
            
            animationOpenProfileImage.isReversed = true
            animationOpenProfileImage.isReversed = true
            cancelButtonForAnimation.isHidden = true
            self.header.profileImage.layer.borderWidth = 3
            self.header.profileImage.layer.borderColor = UIColor.white.cgColor
            
        } else {
            animationCloseProfileImage.startAnimation()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
         super .viewWillAppear(animated)
         navigationController?.navigationBar.isHidden = true
     }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
       
       
        //переверстать констрейнтами
        //пока пусть живет так
        cancelButtonForAnimation.frame = .init(
            x: self.view.bounds.width - 16,
            y: 0,
            width: 16,
            height: 16)
        
        self.backgroundView.frame = .init(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        
        animationOpenProfileImage.addAnimations {
            self.header.addSubview(self.backgroundView)
            self.backgroundView.transform = self.backgroundView.transform.scaledBy(x: 1, y: 1)
            self.backgroundView.addSubview(self.header.profileImage)
            self.header.profileImage.frame = .init(
                x: self.view.bounds.width / 2 - 50,
                y: self.view.bounds.height / 2 - 50,
                width: 100,
                height: 100)
            self.header.profileImage.transform = self.header.profileImage.transform.scaledBy(x: 4, y: 4)
            self.header.profileImage.layer.cornerRadius = 0
            self.header.profileImage.layer.borderWidth = 0
            self.backgroundView.backgroundColor = UIColor.white.withAlphaComponent(0.5)
               }
        
        animationCancelButton.addAnimations {
            self.backgroundView.addSubview(self.cancelButtonForAnimation)
            self.cancelButtonForAnimation.alpha = 1
        }
        
        animationCloseProfileImage.addAnimations {
            self.backgroundView.isHidden = true
            self.cancelButtonForAnimation.isHidden = true
            self.backgroundView.frame = .init(x: 0, y: 0, width: 0, height: 0)
            
            self.header.addSubview(self.header.profileImage)
            self.header.profileImage.transform = self.header.profileImage.transform.scaledBy(x: 0.25, y: 0.25)
            
            NSLayoutConstraint.activate([
        
                self.header.profileImage.topAnchor.constraint(equalTo: self.header.topAnchor, constant: 16),
                self.header.profileImage.leadingAnchor.constraint(equalTo: self.header.leadingAnchor, constant: 16),
                self.header.profileImage.heightAnchor.constraint(equalToConstant: 100),
                self.header.profileImage.widthAnchor.constraint(equalToConstant: 100),
        
            ])
            
         
            self.header.profileImage.layer.cornerRadius = 50
            self.header.profileImage.layer.borderWidth = 3
            self.header.profileImage.layer.borderColor = UIColor.white.cgColor
        }
        
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
            return Storage.arrayOfPosts.count
        default:
            break
        }
        return section
    }
    
    //ПРОБЛЕМА С ПЕРЕИСПОЛЬЗОВАНИЕМ ЯЧЕЕК!!!!! - решена🦆
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: PhotosTableViewCell.self), for: indexPath) as! PhotosTableViewCell
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as! PostTableViewCell
            // let cell = PostTableViewCell()
            cell.post = Storage.arrayOfPosts[indexPath.row]
            return cell
            
            
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        /*  guard let headerView: ProfileHeaderViewNew = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ProfileHeaderViewNew.self)) as? ProfileHeaderViewNew else { return nil }
         print("пока рабоатет,перекрестились")*/
        
        
        //MARK:- ВСЕ СЮДАААААААААА!!!!!!!!!!!!!!!
        //создал жест и добавил его на profileImage
        let tapGest = UITapGestureRecognizer(target: self, action: #selector(tap))
        header.profileImage.addGestureRecognizer(tapGest)
        
        let cancelGest = UITapGestureRecognizer(target: self, action: #selector(cancel))
        cancelButtonForAnimation.addGestureRecognizer(cancelGest)
        
        return header

    }
    
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        switch section {
        case 0:
            return 220
        default:
            return .zero
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
