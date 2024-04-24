//
//  TableViewExtensions+.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 22.04.24.
//

import UIKit

//MARK: TableView Delegates:
extension CountriesVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.countries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountriesCell
        let country = viewModel.countries[indexPath.section]
        
        if let countryName = country.name?.common {
            cell.countryName.text = countryName
        } else {
            cell.countryName.text = "Unknown Country"
        }
        
        if let flagUrlString = country.flags?.png, let flagUrl = URL(string: flagUrlString) {
            cell.flagImage.loadImage(from: flagUrl)
        } else {
            cell.flagImage.image = UIImage(named: "default_flag_image")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = viewModel.countries[indexPath.section]
        let detailsViewModel = DetailsCountryViewModel(from: country)
        let detailsVC = DetailsCountryVC()
        detailsVC.viewModel = detailsViewModel
        
        navigationController?.pushViewController(detailsVC, animated: false)
    }
}

