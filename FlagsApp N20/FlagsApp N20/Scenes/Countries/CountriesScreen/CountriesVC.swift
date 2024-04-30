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
        navigationItem.hidesBackButton = true
        firstTimeLogin()
        updateTrait()
        viewModel.delegate = self
        viewModel.fetchCountries()
        setupUI()
        setupSearch()
        setupLogoutButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.label
        ]
        navigationController?.navigationBar.tintColor = UIColor.label
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
    
    
    
    //MARK: - UI Setup
    private func setupUI() {
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
    private func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: - Setup Search
    private func setupSearch() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Countries"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    //MARK: - Setup Logout
    private func setupLogoutButton() {
        let logoutButton = UIBarButtonItem(
            title: "Logout",
            style: .plain,
            target: self,
            action: #selector(logout)
        )
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.label
        ]
        
        logoutButton.setTitleTextAttributes(attributes, for: .normal)
        navigationItem.rightBarButtonItem = logoutButton
    }
    
    //MARK: - Logout Action
    @objc private func logout() {
        viewModel.logout()
    }
    
    //MARK: - First Time Login Flag
    private func firstTimeLogin() {
        let isFirstLogin = UserDefaults.standard.bool(forKey: "isFirstLogin")
        
        if isFirstLogin {
            showCongratulatoryAlert()
            UserDefaults.standard.set(false, forKey: "isFirstLogin")
        }
    }
    
    //MARK: - Alert On FirstTime
    private func showCongratulatoryAlert() {
        let alert = UIAlertController(
            title: "Congratulations 🎉",
            message: "You have successfully logged in! ✅",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    //MARK: - Trait Update
    private func updateTrait() {
        registerForTraitChanges([UITraitUserInterfaceStyle.self], handler: { (self: Self, previousTraitCollection: UITraitCollection) in
            if self.traitCollection.userInterfaceStyle == .light {
                self.tableView.reloadData()
            } else {
                self.tableView.reloadData()
            }
        })
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
    
    func selectRow(country: Country) {
        let detailsViewModel = DetailsCountryViewModel(from: country)
        let detailsVC = DetailsCountryVC()
        detailsVC.viewModel = detailsViewModel
        
        navigationController?.pushViewController(detailsVC, animated: false)
    }
    
    func didLogout(success: Bool) {
        if success {
            // Handle successful logout (e.g., reset the root view controller)
            if let windowScene = UIApplication.shared
                .connectedScenes
                .first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene,
               let window = windowScene.windows.first {
                
                let loginVC = LoginVC()
                let navigationController = UINavigationController(rootViewController: loginVC)
                window.rootViewController = navigationController
                window.makeKeyAndVisible()
            }
        } else {
            print("Failed to delete Keychain items")
        }
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
        tableView.reloadData()
    }
}
