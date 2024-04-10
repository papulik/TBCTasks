//
//  CustomButton.swift
//  Horoskop N15
//
//  Created by Zuka Papuashvili on 10.04.24.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureButton()
    }
    
    private func configureButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .buttonColorZuka
        layer.cornerRadius = 15
        titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
    }
}
