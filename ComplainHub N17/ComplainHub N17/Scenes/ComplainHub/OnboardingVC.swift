//
//  OnboardingVC.swift
//  ComplainHub N17
//
//  Created by Zuka Papuashvili on 13.04.24.
//

import UIKit

class OnboardingVC: UIViewController {
    
    //MARK: - UI Properties
    let backgroundImage = BackGroundImage(frame: .zero)
    let someText = UILabel()
    let button = CustomButton()
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    //MARK: - OnBoardingVC Button Action:
    private func buttonTapped() {
        let mainVC = MainVC()
        navigationController?.pushViewController(mainVC, animated: true)
    }
    
    //MARK: - Setup UI OnBoarding
    func setupUI() {
        //image:
        backgroundImage.image = UIImage(named: "Group 4")
        //someText:
        someText.text = "შედი აპლიკაციაში და იწუწუნე, რამდენიც გინდა!"
        someText.font = UIFont(name: Constants.font, size: 30)
        someText.textColor = .white
        someText.numberOfLines = 0
        someText.textAlignment = .left
        //button:
        button.setTitle("დაწყება", for: .normal)
        let action = UIAction { [weak self] _ in
            self?.buttonTapped()
        }
        button.addAction(action, for: .touchUpInside)
        //Subs and Constraints:
        addSubsAndConstraints()
    }
    
    func addSubsAndConstraints() {
        //Adding Subs:
        view.addSubview(backgroundImage)
        view.addSubview(someText)
        view.addSubview(button)
        //Disabling autoResizing:
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        someText.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            //background:
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            //Text:
            someText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            someText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 21),
            someText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -180),
            //button:
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 222),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

//MARK: Onboarding Preview

#Preview {
    OnboardingVC()
}
