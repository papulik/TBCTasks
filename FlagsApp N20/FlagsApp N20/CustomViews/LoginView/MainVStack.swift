//
//  MainVStack.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 26.04.24.
//

import UIKit

class MainVStack: UIStackView {
    
    let topVStack = InnerVStack()
    let middleVStack = InnerVStack()
    let bottomVStack = InnerVStack()
    let loginButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        axis = .vertical
        distribution = .equalSpacing
        alignment = .fill
        spacing = 40
        //subs:
        addArrangedSubview(topVStack)
        addArrangedSubview(middleVStack)
        addArrangedSubview(bottomVStack)
        addArrangedSubview(loginButton)
        //top:
        topVStack.loginNameLabel.text = "მომხმარებლის სახელი"
        topVStack.textField.placeholder = "შეიყვანეთ მომხმარებლის სახელი"
        //middle:
        middleVStack.loginNameLabel.text = "პაროლი"
        middleVStack.textField.placeholder = "შეიყვანეთ პაროლი"
        middleVStack.textField.isSecureTextEntry = true
        //bottom:
        bottomVStack.loginNameLabel.text = "გაიმეორეთ პაროლი"
        bottomVStack.textField.placeholder = "განმეორებით შეიყვანეთ პაროლი"
        bottomVStack.textField.isSecureTextEntry = true
        //button:
        loginButton.backgroundColor = .systemBlue
        loginButton.setTitle("შესვლა", for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
}
