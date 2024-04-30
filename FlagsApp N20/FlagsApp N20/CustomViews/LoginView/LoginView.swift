//
//  LoginView.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 26.04.24.
//

import UIKit

class LoginView: UIView {
    
    let avatarImageButton = UIButton()
    let galleryImage = UIButton()
    let mStack = MainVStack()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .darkMode
        addSubview(avatarImageButton)
        addSubview(galleryImage)
        addSubview(mStack)
        //avatar:
        avatarImageButton.setImage(UIImage(named: "AvatarBoy"), for: .normal)
        avatarImageButton.contentMode = .scaleAspectFit
        avatarImageButton.layer.masksToBounds = true
        avatarImageButton.layer.cornerRadius = 25
        //gallery:
        galleryImage.setImage(UIImage(named: "Group 38"), for: .normal)
        galleryImage.imageView?.contentMode = .scaleAspectFit
        galleryImage.layer.masksToBounds = false
        galleryImage.layer.cornerRadius = 15
        //cosntraints:
        constraintsUI()
    }
    
    private func constraintsUI() {
        avatarImageButton.translatesAutoresizingMaskIntoConstraints = false
        galleryImage.translatesAutoresizingMaskIntoConstraints = false
        mStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            avatarImageButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            avatarImageButton.heightAnchor.constraint(equalToConstant: 50),
            avatarImageButton.widthAnchor.constraint(equalToConstant: 50),
            
            galleryImage.topAnchor.constraint(equalTo: topAnchor, constant: 75),
            galleryImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 121),
            galleryImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -122),
            galleryImage.heightAnchor.constraint(equalToConstant: 132),
            
            mStack.topAnchor.constraint(equalTo: galleryImage.bottomAnchor, constant: 50),
            mStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            mStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
        ])
    }
}
