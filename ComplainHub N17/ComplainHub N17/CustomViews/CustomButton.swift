//
//  CustomButton.swift
//  ComplainHub N17
//
//  Created by Zuka Papuashvili on 13.04.24.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemBlue
        layer.cornerRadius = 25
        titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        tintColor = .white
    }
}
