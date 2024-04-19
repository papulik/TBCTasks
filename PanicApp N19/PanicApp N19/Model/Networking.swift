//
//  Networking.swift
//  PanicApp N19
//
//  Created by Zuka Papuashvili on 19.04.24.
//

import Foundation

class Networking {
    
    //MARK: Shared Networking Singleton:
    static let shared = Networking()
    
    func fetchData(completed: @escaping (Result<InfoData, Error>) -> Void) {
        let urlString = "https://imedinews.ge/api/categorysidebarnews/get"
        guard let url = URL(string: urlString) else {
            completed(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completed(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completed(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "Invalid response type"])))
                return
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                completed(.failure(NSError(domain: "", code: httpResponse.statusCode, userInfo: [NSLocalizedDescriptionKey: "HTTP error with status code: \(httpResponse.statusCode)"])))
                return
            }
            
            guard let data = data else {
                completed(.failure(NSError(domain: "", code: -3, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let infoData = try JSONDecoder().decode(InfoData.self, from: data)
                completed(.success(infoData))
            } catch {
                completed(.failure(error))
            }
        }
        task.resume()
    }
}
