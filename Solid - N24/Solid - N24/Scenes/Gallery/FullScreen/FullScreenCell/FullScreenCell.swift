//
//  FullScreenCell.swift
//  Solid - N24
//
//  Created by Zuka Papuashvili on 08.05.24.


import UIKit

class FullScreenCell: UICollectionViewCell {
    
    //MARK: - Cell Identifier
    static let reuseIdentifier = "FullScreenCell"
    
    //MARK: - Setup Image
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    private func setupViews() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    //MARK: - Set Images
    func configure(with urlString: String) {
        imageView.setImage(from: urlString)
    }
}
