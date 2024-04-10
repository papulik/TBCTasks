//
//  DescriptionVC.swift
//  Horoskop N15
//
//  Created by Zuka Papuashvili on 10.04.24.
//

import UIKit

protocol SomeColorDelegate: AnyObject {
    func send(color: UIColor)
}

class DescriptionVC: UIViewController, SomeColorDelegate {
    
    let backgroundImageView = CustomImageView()
    var zodiacSign: ZodiacSign?
    let horoskopView = HoroskopSignAndLabel()
    var colorForFirstVC: UIColor?
    
    weak var delegate: RecieveColorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backGroundColorBlack
        setupBackgroundImageView()
        setupHoroskopView()
        setupZodiacSign()
        horoskopView.button.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    
    func setupZodiacSign() {
        if let zodiacSign = zodiacSign {
            horoskopView.configure(with: zodiacSign)
        }
    }
    
    func setupBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    
    func setupHoroskopView() {
        view.addSubview(horoskopView)
        horoskopView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horoskopView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55),
            horoskopView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            horoskopView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            horoskopView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
        ])
    }
    
    //MARK: - Action Button:
    
    @objc func action() {
        let oppositeSignVC = OppositeSignVC()
        oppositeSignVC.zodiacSign = self.zodiacSign
        self.navigationController?.pushViewController(oppositeSignVC, animated: true)
        oppositeSignVC.delegate = self
    }
    
    //MARK: Protocol Function
    func send(color: UIColor) {
        self.delegate?.recieve(color: color)
    }
}
