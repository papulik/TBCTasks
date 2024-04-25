//
//  CountriesViewModel.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 24.04.24.
//
import UIKit

protocol CountriesViewModelDelegate: AnyObject {
    func didUpdateCountries()
    func didEncounterError(error: String)
    func selectRow(country: Country)
}

protocol Searchable {
    func searchCountries(query: String)
}

class CountriesViewModel {
    weak var delegate: CountriesViewModelDelegate?

    private let networking = Networking.shared
    var countries: [Country] = []

    func fetchCountries() {
        networking.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedCountries):
                    self?.countries = fetchedCountries
                    self?.delegate?.didUpdateCountries()
                case .failure(let error):
                    self?.delegate?.didEncounterError(error: error.localizedDescription)
                }
            }
        }
    }
    
    func selection(index: IndexPath) {
        delegate?.selectRow(country: countries[index.row])
    }
}

extension CountriesViewModel: Searchable {
    func searchCountries(query: String) {
        if query.isEmpty {
            delegate?.didUpdateCountries()
            return
        }

        let lowercasedQuery = query.lowercased()
        countries = countries.filter { country in
            if let commonName = country.name?.common?.lowercased() {
                return commonName.contains(lowercasedQuery)
            }
            return false
        }
        delegate?.didUpdateCountries()
    }
}

