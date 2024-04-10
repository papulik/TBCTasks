//
//  HoroskopSignAndLabel.swift
//  Horoskop N15
//
//  Created by Zuka Papuashvili on 10.04.24.
//

import UIKit


class HoroskopSignAndLabel: UIView {
    
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let bodyLabel = UILabel()
    let button = CustomButton()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        // Configure imageView
        imageView.contentMode = .scaleAspectFit
        
        // Configure nameLabel
        nameLabel.textAlignment = .center
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 24, weight: .bold)
        
        // Configure bodyLabel
        bodyLabel.textColor = .gray
        bodyLabel.font = .systemFont(ofSize: 14, weight: .regular)
        bodyLabel.numberOfLines = 0
        bodyLabel.textAlignment = .left
        
        // Configure button
        button.setTitle("შემდეგ", for: .normal)
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 30 
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(bodyLabel)
        
        // Spacer view
        let spacer = UIView()
        spacer.backgroundColor = .clear // Spacer is invisible
        stackView.addArrangedSubview(spacer)
        
        // Low priority simagleze
        let spacerHeightConstraint = spacer.heightAnchor.constraint(equalToConstant: 100)
        spacerHeightConstraint.priority = UILayoutPriority(rawValue: 250) 
        spacerHeightConstraint.isActive = true
        
        stackView.addArrangedSubview(button)
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView Constraints
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            button.heightAnchor.constraint(equalToConstant: 48),
            imageView.heightAnchor.constraint(equalToConstant: 156),
            
        ])
    }
    
    func configure(with zodiacSign: ZodiacSign) {
        imageView.image = UIImage(named: zodiacSign.imageName)
        nameLabel.text = zodiacSign.name
        bodyLabel.text = zodiacSign.body
    }
}


