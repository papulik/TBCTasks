//
//  CatFactsVC.swift
//  Modulars - N23
//
//  Created by Zuka Papuashvili on 01.05.24.
//

import UIKit

class CatFactsVC: UIViewController {
    
    //MARK: - Properties
    let tableView = UITableView()
    var viewModel = CatFactsViewModel()

    //MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        updateTableView()
    }

    //MARK: - UI Setup
    func setupTableView() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(ciImage: .gray), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor = .gray
        title = "Cat Facts"
        view.backgroundColor = .gray
        view.addSubview(tableView)
        //tableView:
        tableView.register(CatFactsTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.layer.cornerRadius = 20
        tableView.backgroundView = UIView()
        tableView.backgroundView?.backgroundColor = .gray
        tableView.backgroundColor = .gray
        //delegates:
        tableView.dataSource = self
        //constraints:
        tableViewConstraints()
    }

    //MARK: - Constraints
    func tableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 25),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 6),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -6),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25)
        ])
    }
    
    //MARK: - Updating TableView
    func updateTableView() {
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.fetchFacts()
    }
}

//MARK: - Extension TableView DataSource
extension CatFactsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.facts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CatFactsTableViewCell
        let fact = viewModel.facts[indexPath.row]
        
        cell.factsLabel.text = fact.fact
        
        return cell
    }
    
}

