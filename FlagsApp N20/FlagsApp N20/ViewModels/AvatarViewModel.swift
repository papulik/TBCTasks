//
//  AvatarViewModel.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 26.04.24.
//

import UIKit

protocol AvatarVCDelegate: AnyObject {
    func avatarVCDidSelectImage(selectedImage: UIImage)
}

class AvatarViewModel {
    weak var delegate: AvatarVCDelegate?

    func selectAvatarBoy() {
        if let image = UIImage(named: "AvatarBoy") {
            delegate?.avatarVCDidSelectImage(selectedImage: image)
        }
    }

    func selectAvatarGirl() {
        if let image = UIImage(named: "AvatarGirl") {
            delegate?.avatarVCDidSelectImage(selectedImage: image)
        }
    }
}

