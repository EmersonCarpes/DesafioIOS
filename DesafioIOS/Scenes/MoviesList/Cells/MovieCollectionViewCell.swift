//
//  MovieCollectionViewCell.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 13/11/22.
//

import UIKit
import APIServices
import Kingfisher

final class MovieCollectionViewCell: UICollectionViewCell {
    
    lazy private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy private var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    func config(movie: Movie) {
        setupUI()
        
        nameLabel.text = movie.title
        imageView.kf.setImage(with: URL(string: "\(movie.thumbnail.path).\(movie.thumbnail.format)"))
    }
    
    private func setupUI() {
        addSubview(imageView)
        addSubview(nameLabel)
        
        imageView.anchor(top: (anchor: topAnchor, padding: 0),
                         left: (anchor: leadingAnchor, padding: 0),
                         right: (anchor: trailingAnchor, padding: 0),
                         bottom: (anchor: nameLabel.topAnchor, padding: 0))
        
        nameLabel.anchor(left: (anchor: leadingAnchor, padding: 5),
                         right: (anchor: trailingAnchor, padding: 5),
                         bottom: (anchor: bottomAnchor, padding: 0),
                         height: 40)
    }
}
