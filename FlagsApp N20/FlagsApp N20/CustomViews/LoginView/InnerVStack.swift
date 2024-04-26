//
//  InnerVStack.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 26.04.24.
//

import UIKit

class InnerVStack: UIStackView {
    
    let loginNameLabel = UILabel()
    let textField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupVStack()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupVStack() {
        
        axis = .vertical
        distribution = .equalSpacing
        alignment = .fill
        spacing = 6
        
        addArrangedSubview(loginNameLabel)
        addArrangedSubview(textField)
        
        loginNameLabel.font = .systemFont(ofSize: 13, weight: .regular)
        
        // Create a padding view for the left side
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 45))  // Adjust width as needed
        textField.leftView = leftPadding
        textField.leftViewMode = .always  // Always show the left view for consistent padding
        
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .field
        
        constraintsVStack()
    }
    
    private func constraintsVStack() {
        loginNameLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}
