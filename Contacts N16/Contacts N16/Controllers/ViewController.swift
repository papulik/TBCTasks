//
//  ViewController.swift
//  Contacts N16
//
//  Created by Zuka Papuashvili on 12.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    let titleLabel = UILabel()
    //other variables:
    var englishAlphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "#"]
    var sectionedData: [String: [DetailsModel]] = [:]
    var sectionKeys: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        organizeDataIntoSections()
        registerTableViewCells()
    }
    
    func configUI() {
        //UI Setup:
        title = "iOS Squad"
        navigationController?.navigationBar.tintColor = .white
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        //TableView delegates:
        tableView.delegate = self
        tableView.dataSource = self
        //Constraints:
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func organizeDataIntoSections() {
        for model in DetailsModel.squadArray {
            guard let firstLetter = model.name.first?.uppercased() else {
                continue
            }
            
            if var sectionArray = sectionedData[firstLetter] {
                sectionArray.append(model)
                sectionedData[firstLetter] = sectionArray
            } else {
                sectionedData[firstLetter] = [model]
                if !sectionKeys.contains(firstLetter) {
                    // Only add new section keys
                    sectionKeys.append(firstLetter)
                }
            }
        }
        // Sort the section keys
        sectionKeys.sort()
        print("Section Keys: \(sectionKeys)")
    }
    
    private func registerTableViewCells() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
    }
    
}

//MARK: - Delegate Methods

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionKeys.count + 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        } else {
            let sectionKey = sectionKeys[section - 1]
            return sectionedData[sectionKey]?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let sectionKey = sectionKeys[indexPath.section - 1]
        let modelsInSection = sectionedData[sectionKey] ?? []
        let model = modelsInSection[indexPath.row]
        cell.nameLabel.text = model.name
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionKey = sectionKeys[indexPath.section - 1]
        
        if let modelsInSection = sectionedData[sectionKey] {
            let selectedModel = modelsInSection[indexPath.row]
            let vc = DetailsViewController()
            vc.desctiptionArray.append(selectedModel)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
            headerView.backgroundColor = .clear
            
            // Create and configure the image view
            let imageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 60, height: 60))
            imageView.image = UIImage(named: "Avatar Image-5")
            imageView.contentMode = .scaleAspectFit
            imageView.layer.cornerRadius = imageView.frame.height / 2
            imageView.clipsToBounds = true
            headerView.addSubview(imageView)
            // Create and configure the label
            let label = UILabel(frame: CGRect(x: 100, y: 20, width: tableView.frame.width - 120, height: 60))
            label.text = "Zuka Papuashvili"
            label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
            label.textColor = .black
            headerView.addSubview(label)
            // Disclosure:
            let indicatorImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
            indicatorImageView.tintColor = .lightGray
            indicatorImageView.frame = CGRect(x: tableView.frame.width - 40, y: 43, width: 15, height: 15)
            headerView.addSubview(indicatorImageView)
            // Invisible Button:
            let invisibleButton = UIButton(type: .custom)
            invisibleButton.frame = headerView.bounds
            //MARK: - Header Action:
            let action = UIAction { [weak self] _ in
                guard let self = self else { return }
                let vc = DetailsViewController()
                vc.desctiptionArray.append(DetailsModel(name: "Zuka Papuashvili", imageName: "Avatar Image-5", gender: .male, age: 31, hobby: "Boxing"))
                self.navigationController?.pushViewController(vc, animated: false)
            }
            invisibleButton.addAction(action, for: .touchUpInside)
            headerView.addSubview(invisibleButton)
            
            return headerView
            
        } else {
            // Regular section header
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
            let label = UILabel(frame: CGRect(x: 15, y: -10, width: tableView.frame.width - 30, height: 30))
            label.text = sectionKeys[section - 1].uppercased()
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textColor = .lightGray
            headerView.addSubview(label)
            
            return headerView
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            100
        } else {
            30
        }
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return englishAlphabet
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if let sectionIndex = sectionKeys.firstIndex(of: title) {
            return sectionIndex + 1
        } else {
            return 1
        }
    }
    
}

#Preview {
    ViewController()
}
