//
//  CountriesViewModel.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 24.04.24.
//
import Foundation

protocol CountriesViewModelDelegate: AnyObject {
    func didUpdateCountries()
    func didEncounterError(error: String)
    func selectRow(country: Country)
    func didLogout(success: Bool)
}

protocol Searchable {
    func searchCountries(query: String)
}

class CountriesViewModel {
    weak var delegate: CountriesViewModelDelegate?
    
    private let networking = Networking.shared
    var allCountries: [Country] = []
    var countries: [Country] = []
    
    //MARK: - Fetching Logic
    func fetchCountries() {
        networking.fetchData { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let fetchedCountries):
                    self?.allCountries = fetchedCountries
                    self?.countries = fetchedCountries
                    self?.delegate?.didUpdateCountries()
                case .failure(let error):
                    self?.delegate?.didEncounterError(error: error.localizedDescription)
                }
            }
        }
    }
    
    //MARK: - Row Selection Logic
    func selection(index: IndexPath) {
        delegate?.selectRow(country: countries[index.section])
    }
    
    //MARK: - Logout Logic
    func logout() {
        let deletedUsername = KeychainService.delete(forKey: "username")
        let deletedPassword = KeychainService.delete(forKey: "password")
        
        let success = deletedUsername && deletedPassword
        delegate?.didLogout(success: success)
    }
}

extension CountriesViewModel: Searchable {
    
    //MARK: - Searching Logic
    func searchCountries(query: String) {
        if query.isEmpty {
            countries = allCountries
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

