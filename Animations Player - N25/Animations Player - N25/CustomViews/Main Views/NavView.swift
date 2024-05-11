//
//  NavView.swift
//  Animations Player - N25
//
//  Created by Zuka Papuashvili on 10.05.24.
//

import UIKit

final class NavView: UIView {
    
    //MARK: - Properties
    private let button1 = UIButton(type: .system)
    private let button2 = UIButton(type: .system)
    private let button3 = UIButton(type: .system)
    private var activeButton: UIButton?
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
        layoutButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Buttons
    private func setupButtons() {
        backgroundColor = .tabBar
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        layer.cornerRadius = 40
        layer.shadowColor = UIColor.white.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 40
        
        button1.setImage(UIImage(systemName: "house"), for: .normal)
        button2.setImage(UIImage(systemName: "music.quarternote.3"), for: .normal)
        button3.setImage(UIImage(systemName: "heart"), for: .normal)
        
        let buttons = [button1, button2, button3]
        buttons.forEach { button in
            button.tintColor = .lightGray
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            addSubview(button)
        }
    }
    
    //MARK: - Constraints
    private func layoutButtons() {
        let buttons = [button1, button2, button3]
        buttons.forEach { button in
            button.translatesAutoresizingMaskIntoConstraints = false
        }
        //button1
        NSLayoutConstraint.activate([
            button2.centerXAnchor.constraint(equalTo: centerXAnchor),
            button2.centerYAnchor.constraint(equalTo: centerYAnchor),
            button2.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25),
            button2.heightAnchor.constraint(equalTo: button2.widthAnchor)
        ])
        //button2
        NSLayoutConstraint.activate([
            button1.centerYAnchor.constraint(equalTo: centerYAnchor),
            button1.trailingAnchor.constraint(equalTo: button2.leadingAnchor, constant: -20),
            button1.widthAnchor.constraint(equalTo: button2.widthAnchor),
            button1.heightAnchor.constraint(equalTo: button1.widthAnchor)
        ])
        //button3
        NSLayoutConstraint.activate([
            button3.centerYAnchor.constraint(equalTo: centerYAnchor),
            button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 20),
            button3.widthAnchor.constraint(equalTo: button2.widthAnchor),
            button3.heightAnchor.constraint(equalTo: button3.widthAnchor)
        ])
    }
    
    //MARK: Buttons Action & Animations
    @objc private func buttonAction(sender: UIButton) {
        if let currentActive = activeButton, currentActive != sender {
            UIView.animate(withDuration: 0.2, animations: {
                currentActive.transform = .identity
                currentActive.tintColor = .lightGray
                currentActive.layer.zPosition = 0
                self.layoutIfNeeded()
            })
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            sender.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
            sender.tintColor = .systemBlue
            sender.layer.zPosition = 1
            self.layoutIfNeeded()
        })
        
        activeButton = sender
    }
}
