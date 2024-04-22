//
//  CustomButtonLinks.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 21.04.24.
//

import UIKit

class CustomButtonLinks: UIStackView {
    
    let linkButton1 = UIButton()
    let linkButton2 = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStack()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStack() {
        axis = .horizontal
        distribution = .fillEqually
        alignment = .center
        spacing = 87
        setupUI()
    }
    
    private func setupUI() {
        addArrangedSubview(linkButton1)
        addArrangedSubview(linkButton2)
        //button1:
        linkButton1.setImage(UIImage(named: "Group 19"), for: .normal)
        linkButton1.backgroundColor = .clear
        linkButton1.contentMode = .scaleAspectFit
        //button2:
        linkButton2.setImage(UIImage(named: "Group 18"), for: .normal)
        linkButton2.backgroundColor = .clear
        linkButton2.contentMode = .scaleAspectFit
        //constraints:
        NSLayoutConstraint.activate([
            linkButton1.heightAnchor.constraint(equalToConstant: 50),
            linkButton2.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

