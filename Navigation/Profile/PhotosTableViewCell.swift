//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Apple on 12.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageService
import iOSIntPackage

class PhotosTableViewCell: UITableViewCell {

    let processOnThread = ImageProcessor()

    private let defaultInset: CGFloat = 12
    private let miniInset: CGFloat = 8
    
    private let photoLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.text = "Photos"
        photosLabel.font = UIFont.boldSystemFont(ofSize: 24)
        photosLabel.textColor = .black
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        return photosLabel
    }()
    
    private let pointer: UILabel = {
        let pointer = UILabel()
        pointer.text = "→"
        pointer.textColor = .black
        pointer.font = .systemFont(ofSize: 20, weight: .bold)
        pointer.translatesAutoresizingMaskIntoConstraints = false
        return pointer
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotoCollectionViewCell.self))
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        
        contentView.backgroundColor = .white
        
        contentView.addSubview(photoLabel)
        contentView.addSubview(pointer)
        contentView.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: defaultInset),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: defaultInset),
            pointer.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            pointer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1 * defaultInset),
            collectionView.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: defaultInset),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: defaultInset),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1 * defaultInset),
            collectionView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - 48) / 4),

            contentView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: defaultInset)
        ])
        print(UIScreen.main.bounds.width)
    }
    
}

extension PhotosTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Storage.photoCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: PhotoCollectionViewCell.self), for: indexPath) as! PhotoCollectionViewCell
        //время выполнения наложения фильтра с момента нажатия логин кнопки с разными приоритетами
        //qos: .default - 7.34
        //qos: .background - 7.35
        //qos: .userInitiated - 7.34
        //qos: .userInteractive - 7.36
        //qos: .utility - 7.35
        //- разницы нет
        processOnThread.processImagesOnThread(sourceImages: Storage.photoCollection, filter: .fade, qos: .default, completion: { (myNewArray) in
            DispatchQueue.main.async {
                cell.photo.image = UIImage(cgImage: myNewArray[indexPath.row]!)
            }
        })
        cell.layer.cornerRadius = 6
        return cell
    }
    
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width - 30) / 4
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return miniInset
    }
    
}



