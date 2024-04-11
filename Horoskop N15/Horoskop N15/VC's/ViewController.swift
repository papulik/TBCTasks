//
//  ViewController.swift
//  Horoskop N15
//
//  Created by Zuka Papuashvili on 10.04.24.
//

import UIKit

protocol RecieveColorDelegate: AnyObject {
    func recieve(color: UIColor)
}

class ViewController: UIViewController, RecieveColorDelegate {
    
    let imageView = CustomImageView()
    let mainPageView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configUI()
        addConstraints()
        mainPageView.button.addTarget(self, action: #selector(action), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func addSubViews() {
        // Adding Subviews
        view.addSubview(imageView)
        view.addSubview(mainPageView)
        
        // Turn off auto resizing
        imageView.translatesAutoresizingMaskIntoConstraints = false
        mainPageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configUI() {
        view.backgroundColor = .backGroundColorBlack
        
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            // Image view constraints
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            // Main view constraints
            mainPageView.topAnchor.constraint(equalTo: view.topAnchor),
            mainPageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainPageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainPageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    //MARK: Protocol Function
    
    func recieve(color: UIColor) {
        view.backgroundColor = color
    }
    
    //MARK: - Button Action:
    
    @objc func action() {
        guard let signName = self.mainPageView.textField.text, !signName.isEmpty,
              let zodiacSign = ZodiacSign.zodiacSign(forName: signName) else {
            let alertVC = UIAlertController(title: "Unknown Name ‼️", message: "გთხოვთ ჩაწეროთ ზოდიაქოები ქართულად, მაგალითად (ვერძი), (კურო) და ასე შემდეგ. მადლობა წინასწარ 😌", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alertVC.addAction(action)
            present(alertVC, animated: true)
            print("No zodiac sign found for name: \(self.mainPageView.textField.text ?? "")")
            return
            
        }
        
        let descriptionVC = DescriptionVC()
        descriptionVC.zodiacSign = zodiacSign
        self.navigationController?.pushViewController(descriptionVC, animated: true)
        
        descriptionVC.delegate = self
    }
    
}
