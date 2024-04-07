//
//  ViewController.swift
//  LoginPage N14
//
//  Created by Zuka Papuashvili on 06.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    //ცალკე გავიტანე და ინსტანსები აქ შევქმენი იმიტორო ძალიან ბევრი კოდი იყო :). ამავდროულად ორად დავყავი, რამაც ცოტა გააადვილა მუშაობა. იმედია მოგეწონებათ.
    let topView = TopView()
    let bottomStackView = BottomStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureTopUI()
        configureStackUI()
        buttonActions()
    }
    
    // ღილაკებმაც ხო უნდა ქნან რაღაცა ცოდოები არიან 🫣.
    func buttonActions() {
        bottomStackView.enterButton.addTarget(self, action: #selector(enterAction), for: .touchUpInside)
        bottomStackView.googleButton.addTarget(self, action: #selector(enterAction), for: .touchUpInside)
        bottomStackView.facebookButton.addTarget(self, action: #selector(enterAction), for: .touchUpInside)
    }
    
    @objc func enterAction() {
        let errorVC = UIAlertController(title: "Work In Progress 👷", message: "this feature of login is currently unavailable, we apologise for this, in the meantime please take a look at other features of the app.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        errorVC.addAction(action)
        present(errorVC, animated: true)
    }

    func configureTopUI() {
        //adding Subviews:
        view.addSubview(topView)
        //Disabling Autoresizing:
        topView.translatesAutoresizingMaskIntoConstraints = false
        //adding Constraints:
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    func configureStackUI() {
        view.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // activate constraints:
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 24),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -28)
        ])
    }
    
}


