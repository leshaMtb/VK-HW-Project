//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Apple on 12.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageService
import iOSIntPackage

class PhotoViewController: UIViewController {


    private var imageCollection: [UIImage] = []
    var imagePublisherFacade: ImagePublisherFacade?


    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())


    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }


    override func viewDidDisappear(_ animated: Bool) {
          super.viewDidDisappear(animated)

          imagePublisherFacade?.removeSubscription(for: self)
          imagePublisherFacade?.rechargeImageLibrary()
      }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        title = "Photo Gallery"
        collectionView.backgroundColor = .white
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotoCollectionViewCell.self))
        
        collectionView.delegate = self
        collectionView.dataSource = self

        imagePublisherFacade?.subscribe(self)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PhotoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotoCollectionViewCell.self), for: indexPath) as! PhotoCollectionViewCell
        cell.photo.image = imageCollection[indexPath.item]
        return cell
    }
}

extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - 32) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
}




extension PhotoViewController: ImageLibrarySubscriber {

    func receive(images: [UIImage]) {
        self.imageCollection = images
        collectionView.reloadData()
    }
}


