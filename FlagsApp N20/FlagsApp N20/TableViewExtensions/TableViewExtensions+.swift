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
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CountriesCell
        let country = countries[indexPath.section]
        
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
        let country = countries[indexPath.section]
        let detailsVC = DetailsCountryVC()
        detailsVC.countryDetails.imageUrl = country.flags?.png
        detailsVC.countryDetails.titleName = country.name?.common
        detailsVC.countryDetails.aboutBody = country.flags?.alt
        detailsVC.countryDetails.countryName = country.name?.common
        detailsVC.countryDetails.spellingName = country.altSpellings?.last
        detailsVC.countryDetails.capitalName = country.capital?.first
        if let currencies = country.currencies, let firstCurrencyKey = currencies.keys.first {
            if let currency = currencies[firstCurrencyKey] {
                let currencySymbol = currency.symbol ?? ""
                let currencyName = currency.name ?? ""
                let currencyDisplay = "\(currencyName) - \(currencySymbol)"
                detailsVC.countryDetails.currencyName = currencyDisplay
            }
        }
        
        detailsVC.countryDetails.regionName = country.region
        if let borders = country.borders {
            let bordersDisplay = borders.joined(separator: ", ")
            detailsVC.countryDetails.neighborsName = bordersDisplay
        }
        detailsVC.countryDetails.googleURL = country.maps?.googleMaps
        detailsVC.countryDetails.openStreetURL = country.maps?.openStreetMaps
        
        navigationController?.pushViewController(detailsVC, animated: false)
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
