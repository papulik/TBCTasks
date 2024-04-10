//
//  OppositeSignVC.swift
//  Horoskop N15
//
//  Created by Zuka Papuashvili on 10.04.24.
//

import UIKit

class OppositeSignVC: UIViewController {
    
    let backgroundImageView = CustomImageView()
    var zodiacSign: ZodiacSign?
    let lastPageView = LastPageView()
    let buttonStack = RedBlueButtonsStack()
    
    weak var delegate: SomeColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGroundColorBlack
        setupBackgroundImageView()
        setupZodiacSign()
        setupViewController()
        //button actions:
        buttonStack.buttonRed.addTarget(self, action: #selector(redAction), for: .touchUpInside)
        buttonStack.buttonBlue.addTarget(self, action: #selector(blueAction), for: .touchUpInside)
    }
    
    func setupZodiacSign() {
        if let zodiacSign = zodiacSign {
            lastPageView.configure(with: zodiacSign)
        }
    }
    
    
    func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupViewController() {
        view.addSubview(lastPageView)
        lastPageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStack)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //View:
            lastPageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            lastPageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //Stack:
            buttonStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30)
        ])
    }
    
    //MARK: - Button Actions:
    
    @objc func redAction() {
        let color = buttonStack.buttonRed.backgroundColor
        delegate?.send(color: color!)
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func blueAction() {
        let color = buttonStack.buttonBlue.backgroundColor
        delegate?.send(color: color!)
        navigationController?.popToRootViewController(animated: true)
    }
}
