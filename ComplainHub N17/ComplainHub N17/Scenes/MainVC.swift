//
//  MainVC.swift
//  ComplainHub N17
//
//  Created by Zuka Papuashvili on 13.04.24.
//

import UIKit

protocol DataModelDelegate: AnyObject {
    func sendData(data: DataModel)
}

class MainVC: UIViewController {
    
    //MARK: - UI Properties
    let backgroundImage = BackGroundImage(frame: .zero)
    let button = CustomButton()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 200)
        layout.minimumInteritemSpacing = 2
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    //MARK: Other Properties
    var someData = [DataModel(imageName: Constants.imageOneName, topText: "დავიღალე მარა ეგ არაფერი", detailText: "სამაგიეროდ გამოდის"),
                    DataModel(imageName: Constants.imageTwoName, topText: "ბარათი ნომერი 2", detailText: "ბარათი ნომერი ორი ინფორმაციები."),
                    DataModel(imageName: Constants.imageThreeName, topText: "ექსტრა ბარათი", detailText: "ექსტრა ბარათის მონაცემები და რაღაცეები"),
                    DataModel(imageName: Constants.imageFourName, topText: "გამარჯობა როგორახარ რავი ვარ რა", detailText: "დავიღალე მარა გამოვიდა მგონი"),
    ]
    
    //MARK: LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: - MainVC Button Action:
    private func buttonTapped() {
        let vc = NewCardVC()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupUI() {
        //button:
        button.setTitle("ახალი ბარათის დამატება", for: .normal)
        let buttonAction = UIAction { [weak self] _ in
            self?.buttonTapped()
        }
        button.addAction(buttonAction, for: .touchUpInside)
        //collection:
        collectionView.backgroundColor = .clear
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        //addsubs:
        addSubsAndConstraints()
        //delegates:
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func addSubsAndConstraints() {
        //Subs:
        view.addSubview(backgroundImage)
        view.addSubview(collectionView)
        view.addSubview(button)
        //Disable Resizing:
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        //MARK: - Constraints
        NSLayoutConstraint.activate([
            //image:
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            //collection:
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -287),
            //button
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 43),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -104),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

//MARK: - Preview
#Preview {
    MainVC()
}
