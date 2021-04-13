//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Apple on 12.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    
    let photo: UIImageView = {
           var photo = UIImageView()
           photo.translatesAutoresizingMaskIntoConstraints = false
           photo.contentMode = .scaleToFill
           return photo
       }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        photo.frame = contentView.frame
        contentView.addSubview(photo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
