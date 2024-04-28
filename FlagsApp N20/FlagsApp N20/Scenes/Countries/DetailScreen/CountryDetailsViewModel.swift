//
//  CountryDetailsViewModel.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 24.04.24.
//

import Foundation

protocol DetailsCountryViewModelDelegate: AnyObject {
    func didUpdateCountryDetails()
    func didFailWithError(_ error: String)
}

class DetailsCountryViewModel {
    
    weak var delegate: DetailsCountryViewModelDelegate?
    
    var imageUrl: String?
    var titleName: String?
    var aboutBody: String?
    var countryName: String?
    var spellingName: String?
    var capitalName: String?
    var currencyName: String?
    var regionName: String?
    var neighborsName: String?
    var googleURL: String?
    var openStreetURL: String?
    
    init(from country: Country) {
        self.imageUrl = country.flags?.png
        self.titleName = country.name?.common
        self.aboutBody = country.flags?.alt
        self.countryName = country.name?.common
        self.spellingName = country.altSpellings?.last
        self.capitalName = country.capital?.first
        
        if let currencies = country.currencies, let firstCurrencyKey = currencies.keys.first {
            if let currency = currencies[firstCurrencyKey] {
                self.currencyName = "\(currency.name ?? "") - \(currency.symbol ?? "")"
            }
        }
        
        self.regionName = country.region
        if let borders = country.borders {
            self.neighborsName = borders.joined(separator: ", ")
        }
        
        self.googleURL = country.maps?.googleMaps
        self.openStreetURL = country.maps?.openStreetMaps
    }
}

