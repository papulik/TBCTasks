//
//  CollectionViewCell.swift
//  ComplainHub N17
//
//  Created by Zuka Papuashvili on 13.04.24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var topLabel = UILabel()
    var detailsLabel = UILabel()
    let verticalStack = UIStackView()
    let spacerTop = UIView()
    let spacerBottom = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Collection Cell Setup
    func cellSetup() {
        //stack:
        stackSetup()
        //Constraints:
        NSLayoutConstraint.activate([
            //stack:
            verticalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            verticalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            verticalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            //image:
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40),
            //SPACER:
            spacerTop.heightAnchor.constraint(equalToConstant: 6),
            spacerBottom.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    //MARK: Cell Stack Setup
    func stackSetup() {
        //subs:
        contentView.addSubview(verticalStack)
        //resizing:
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        //Stack Subs:
        verticalStack.addArrangedSubview(imageView)
        verticalStack.addArrangedSubview(spacerTop)
        verticalStack.addArrangedSubview(topLabel)
        verticalStack.addArrangedSubview(detailsLabel)
        verticalStack.addArrangedSubview(spacerBottom)
        //stack:
        verticalStack.axis = .vertical
        verticalStack.distribution = .equalSpacing
        verticalStack.alignment = .leading
        verticalStack.spacing = 4
    }
    
    //MARK: - Cell Configuration
    func configureCell(imageName: String, topText: String, details: String) {
        // Configure the image view
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        // Configure the top label
        topLabel.text = topText
        topLabel.font = UIFont(name: Constants.font, size: 16)
        topLabel.textColor = .white
        topLabel.numberOfLines = 3
        // Configure the details label
        detailsLabel.text = details
        detailsLabel.font = UIFont(name: Constants.font, size: 10)
        detailsLabel.textColor = .lightGray
        detailsLabel.numberOfLines = 4
    }
}
