//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Apple on 06.04.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import StorageService

final class PostTableViewCell: UITableViewCell {
    
    var post: PostNew? {
        didSet{
            authorLabel.text = post?.author
            imageView1.image = post?.image
            descriptionLabel.text = post?.description
            likesLabel.text = post?.likes
            viewsCountLabel.text = post?.viewsCount
        }
    }
    
    private let authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        authorLabel.textColor = .black
        authorLabel.numberOfLines = 2
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        return authorLabel
    }()
    
    private let imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 14.0, weight: .light)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    private let likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
        likesLabel.textColor = .black
        likesLabel.numberOfLines = 1
        likesLabel.textAlignment = .left
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()
    
    private let viewsCountLabel: UILabel = {
        let viewsCountLabel = UILabel()
        viewsCountLabel.font = UIFont.systemFont(ofSize: 16.0, weight: .light)
        viewsCountLabel.textColor = .black
        viewsCountLabel.numberOfLines = 1
        viewsCountLabel.textAlignment = .right
        viewsCountLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsCountLabel
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    func setUpView() {
        
        contentView.addSubview(authorLabel)
        contentView.addSubview(imageView1)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsCountLabel)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: CGFloat(16)),
            authorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: CGFloat(16)),
            authorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: CGFloat(-16)),
            
            imageView1.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: CGFloat(16)),
            imageView1.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView1.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView1.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.75),
            
            descriptionLabel.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: CGFloat(16)),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: CGFloat(-16)),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: CGFloat(16)),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: CGFloat(16)),
            likesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: (16)),
            likesLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: CGFloat(-16)),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: CGFloat(-16)),
            
            viewsCountLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: CGFloat(16)),
            viewsCountLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: (16)),
            viewsCountLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: CGFloat(-16)),
            viewsCountLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: CGFloat(-16))
        ])
    }
}
