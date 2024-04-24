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
    var viewModel = CountriesViewModel()
    let searchController = UISearchController(searchResultsController: nil)
    
    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        //viewModel:
        viewModel.delegate = self
        viewModel.fetchCountries()
        
        setupUI()
        setupSearch()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.label
            ]
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setNeedsLayout()
        navigationController?.navigationBar.tintColor = .label
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
    }
    
    func setupSearch() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Countries"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    //MARK: - UI Setup
    func setupUI() {
        view.backgroundColor = .darkMode
        title = "Countries"
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .darkMode
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
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

//MARK: - CountriesViewModel Delegate:
extension CountriesVC: CountriesViewModelDelegate {
    
    func didUpdateCountries() {
        tableView.reloadData()
    }
    
    func didEncounterError(error: String) {
        print(error)
    }
    
}

//MARK: - LoadImage Extension
extension UIImageView {
    func loadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, let image = UIImage(data: data), error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.image = image
            }
        }.resume()
    }
}

//MARK: - Search Delegate:
extension CountriesVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        viewModel.searchCountries(query: searchText)
    }
}
