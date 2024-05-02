//
//  CatFactsViewModel.swift
//  Modulars - N23
//
//  Created by Zuka Papuashvili on 01.05.24.
//

import Foundation
import SimpleNetworking

class CatFactsViewModel {
    
    var facts: [CatFact] = []
    
    var onUpdate: (() -> Void)?
    
    func fetchFacts() {
        let url = URL(string: "https://catfact.ninja/facts")!
        NetworkingService.shared.fetchData(from: url) { [weak self] (result: Result<FactsResponse, Error>) in
            switch result {
            case .success(let response):
                self?.facts = response.data
                self?.onUpdate?()
            case .failure(let error):
                print("Error fetching facts:", error)
            }
        }
    }
}
