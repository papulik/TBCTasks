//
//  Networking.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 20.04.24.
//

import Foundation

class Networking {
    
    //MARK: Shared Networking Singleton:
    static let shared = Networking()
    
    func fetchData(completed: @escaping (Result<[Country], Error>) -> Void) {
        let urlString = "https://restcountries.com/v3.1/all"
        guard let url = URL(string: urlString) else {
            completed(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completed(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completed(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "HTTP error"])))
                return
            }
            
            guard let data = data else {
                completed(.failure(NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let countries = try JSONDecoder().decode([Country].self, from: data)
                completed(.success(countries))
            } catch {
                completed(.failure(error))
            }
        }
        task.resume()
    }
}
