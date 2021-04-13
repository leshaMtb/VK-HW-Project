//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Apple on 24.03.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let reuseId = "cellId"
    let tableView: UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  navigationController?.navigationBar.isHidden = true
        
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
                     return Storage.arrayOfPosts.count
                 default:
                     break
                 }
                 return section
       // return Storage.arrayOfPosts.count
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
        guard let headerView: ProfileHeaderViewNew = tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: ProfileHeaderViewNew.self)) as? ProfileHeaderViewNew else { return nil }
        print("пока рабоатет,перекрестились")
        return headerView
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
