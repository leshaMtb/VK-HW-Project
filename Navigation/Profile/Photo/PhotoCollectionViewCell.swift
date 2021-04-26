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
        var photo1 = UIImageView()
        photo1.translatesAutoresizingMaskIntoConstraints = false
        photo1.contentMode = .scaleToFill
        photo1.layer.cornerRadius = 6
        photo1.clipsToBounds = true
        
        return photo1
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
