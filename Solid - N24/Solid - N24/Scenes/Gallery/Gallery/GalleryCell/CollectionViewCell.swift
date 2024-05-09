//
//  CollectionViewCell.swift
//  Solid - N24
//
//  Created by Zuka Papuashvili on 07.05.24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    //MARK: - Cell Identifier
    static let reuseIdentifier = "imageCell"
    
    //MARK: - Cell Configuration
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Image Set
    func configure(with urlString: String) {
        imageView.setImage(from: urlString)
    }
}
