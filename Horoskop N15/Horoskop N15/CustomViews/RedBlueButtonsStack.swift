//
//  RedBlueButtonsStack.swift
//  Horoskop N15
//
//  Created by Zuka Papuashvili on 10.04.24.
//

import UIKit

class RedBlueButtonsStack: UIStackView {

    let buttonRed = CustomButton()
    let buttonBlue = CustomButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        alignment = .fill
        distribution = .fill
        spacing = 30
        configureButtons()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureButtons() {
        
        addArrangedSubview(buttonRed)
        addArrangedSubview(buttonBlue)
        //red:
        buttonRed.setTitle("წიტელი", for: .normal)
        buttonRed.backgroundColor = .red
        //blue:
        buttonBlue.setTitle("ლურჯი", for: .normal)
        buttonBlue.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            buttonRed.heightAnchor.constraint(equalToConstant: 46),
            buttonBlue.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
}
