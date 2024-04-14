//
//  NewCardVC.swift
//  ComplainHub N17
//
//  Created by Zuka Papuashvili on 13.04.24.
//

import UIKit

class NewCardVC: UIViewController {
    
    //MARK: - UI Properties
    let backgroundImage = BackGroundImage(frame: .zero)
    let card = CardView()
    let button = CustomButton()
    
    //MARK: - Other Properties
    weak var delegate: DataModelDelegate?

    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - NewCardVC Button Action:
    func buttonTapped() {
        guard let imageName = card.selectedImageName,
              let topText = card.titleTextField.text,
              let detailText = card.detailTextField.text else {
            //Handle the error:
            let alertVC = UIAlertController(title: "Found Nil", message: "გთხოვთ შეავსოთ ყველა საჭირო ბმული, მადლობა :)", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .cancel)
            alertVC.addAction(alertAction)
            return
        }
        
        let someCard = DataModel(imageName: imageName, topText: topText, detailText: detailText)
        delegate?.sendData(data: someCard)
        navigationController?.popViewController(animated: true)
    }
    
    func setupUI() {
        //nav setup:
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .white
        //button:
        button.setTitle("დამატება", for: .normal)
        button.backgroundColor = .systemGreen
        let buttonAction = UIAction { [weak self] _ in
            self?.buttonTapped()
        }
        button.addAction(buttonAction, for: .touchUpInside)
        //add subs:
        addSubsAndConstraints()
    }
    
    func addSubsAndConstraints() {
        //subs:
        view.addSubview(backgroundImage)
        view.addSubview(card)
        view.addSubview(button)
        //resizing:
        card.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            //background:
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            //card:
            card.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 47),
            card.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33),
            card.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            //button:
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 132)
        ])
    }

}

//MARK: Preview
#Preview {
    NewCardVC()
}
