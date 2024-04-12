//
//  DetailsViewController.swift
//  Contacts N16
//
//  Created by Zuka Papuashvili on 12.04.24.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let backgroundView = UIView()
    var avatarImage = UIImageView()
    let nameLabel = UILabel()
    let tableView = UITableView()
    //other variables:
    var desctiptionArray: [DetailsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubsOnSelfView()
        addSubsOnInnerView()
        configureUI()
        constraints()
        registerTableViewCells()
    }
    
    func addSubsOnSelfView() {
        view.addSubview(backgroundView)
        view.addSubview(tableView)
    }
    
    func addSubsOnInnerView() {
        backgroundView.addSubview(avatarImage)
        backgroundView.addSubview(nameLabel)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //avatar:
            avatarImage.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            avatarImage.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            avatarImage.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, multiplier: 0.5),
            avatarImage.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, multiplier: 0.5),
            //name:
            nameLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 8),
            nameLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
        ])
    }
    
    func configureUI() {
        view.backgroundColor = .white
        //background View:
        backgroundView.backgroundColor = .darkGray
        //avatar:
        avatarImage.image = UIImage(named: desctiptionArray.first?.imageName ?? "")
        avatarImage.contentMode = .scaleToFill
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = 70
        //nameLabel:
        nameLabel.text = desctiptionArray.first?.name
        nameLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        nameLabel.textColor = .white
        //delegates:
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func constraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //BackgroundView:
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backgroundView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            //TavbleView:
            tableView.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 7),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -7),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30)
            
        ])
    }
    
    private func registerTableViewCells() {
        tableView.register(DetailsTableViewCell.self, forCellReuseIdentifier: "DetailsTableViewCell")
        tableView.reloadData()
    }
    
}

extension DetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTableViewCell", for: indexPath) as? DetailsTableViewCell else {
            return UITableViewCell()
        }
        if indexPath.row == 0 {
            cell.leftTextLabel.text = "Gender:"
            cell.rightTextLabel.text = "\(desctiptionArray.first?.gender.rawValue ?? "Gender unavailable")"
        } else if indexPath.row == 1 {
            if let age = desctiptionArray.first?.age {
                cell.rightTextLabel.text = String(age)
            } else {
                cell.rightTextLabel.text = "Age unavailable"
            }
            cell.leftTextLabel.text = "Age (years):"
        } else if indexPath.row == 2 {
            cell.leftTextLabel.text = "Hobby"
            cell.rightTextLabel.text = desctiptionArray.first?.hobby ?? "Hobby Unavailable"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
}



#Preview {
    DetailsViewController()
}
