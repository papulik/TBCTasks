//
//  CountriesVC.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 20.04.24.
//

import UIKit

class CountriesVC: UIViewController {
    
    //MARK: - UI Properties
    let tableView = UITableView()
    var countries = [Country]()
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchCountriesData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController!.navigationBar.prefersLargeTitles = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setNeedsLayout()
    }
    
    //MARK: - UI Setup
    func setupUI() {
        title = "Countries"
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CountriesCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableViewConstraints()
    }
    
    //MARK: - Constraints
    func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: FetchingData
    func fetchCountriesData() {
        Networking.shared.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedCountries):
                    self?.countries = fetchedCountries
                    self?.tableView.reloadData()
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
        }
    }
}

#Preview {
    CountriesVC()
}
