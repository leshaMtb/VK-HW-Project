//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Apple on 12.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let photoLabel: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let photo1: UIImageView = {
        let photo1 = UIImageView()
        photo1.image = PhotoGallery.photoCollection[0]
        photo1.clipsToBounds = true
        photo1.translatesAutoresizingMaskIntoConstraints = false
        photo1.layer.cornerRadius = 6
        photo1.contentMode = .scaleAspectFill
        return photo1
    }()
    
    let photo2: UIImageView = {
        let photo2 = UIImageView()
        photo2.image = PhotoGallery.photoCollection[1]
        photo2.clipsToBounds = true
        photo2.translatesAutoresizingMaskIntoConstraints = false
        photo2.layer.cornerRadius = 6
        photo2.contentMode = .scaleAspectFill
        return photo2
    }()
    
    let photo3: UIImageView = {
        let photo3 = UIImageView()
        photo3.image = PhotoGallery.photoCollection[2]
        photo3.translatesAutoresizingMaskIntoConstraints = false
        photo3.clipsToBounds = true
        photo3.layer.cornerRadius = 6
        photo3.contentMode = .scaleAspectFill
        return photo3
    }()
    
    let photo4: UIImageView = {
        let photo4 = UIImageView()
        photo4.image = PhotoGallery.photoCollection[3]
        photo4.clipsToBounds = true
        photo4.translatesAutoresizingMaskIntoConstraints = false
        photo4.layer.cornerRadius = 6
        photo4.contentMode = .scaleAspectFill
        return photo4
    }()
    
    let photoStack: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.contentMode = .scaleAspectFill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    let pointer: UILabel = {
        let pointer = UILabel()
        pointer.text = "→"
        pointer.textColor = .black
        pointer.font = .systemFont(ofSize: 20, weight: .bold)
        pointer.translatesAutoresizingMaskIntoConstraints = false
        return pointer
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpViews() {
        photoStack.addArrangedSubview(photo1)
        photoStack.addArrangedSubview(photo2)
        photoStack.addArrangedSubview(photo3)
        photoStack.addArrangedSubview(photo4)
        
        contentView.addSubview(photoLabel)
        contentView.addSubview(photoStack)
        contentView.addSubview(pointer)
        
        NSLayoutConstraint.activate([
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            photoStack.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photoStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoStack.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
            
            pointer.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            pointer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            pointer.heightAnchor.constraint(equalToConstant: 20),
            pointer.widthAnchor.constraint(equalToConstant: 20)
        ])
        
    }
}


