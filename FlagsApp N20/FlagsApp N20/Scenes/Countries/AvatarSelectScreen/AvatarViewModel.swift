//
//  AvatarViewModel.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 26.04.24.
//

import Foundation

protocol AvatarVCDelegate: AnyObject {
    func avatarVCDidSelectImage(named: String)
}

class AvatarViewModel {
    weak var delegate: AvatarVCDelegate?
    
    func selectAvatarBoy() {
        delegate?.avatarVCDidSelectImage(named: "AvatarBoy")
    }
    
    func selectAvatarGirl() {
        delegate?.avatarVCDidSelectImage(named: "AvatarGirl")
    }
}
