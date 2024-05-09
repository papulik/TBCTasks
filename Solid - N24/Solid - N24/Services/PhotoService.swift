//
//  PhotoService.swift
//  Solid - N24
//
//  Created by Zuka Papuashvili on 09.05.24.
//

import Foundation
import SimpleNetworking

final class PhotoService {
    private let baseURL = "https://api.unsplash.com/photos/"
    private let keyID = "zCUjWFBBrTwa9xixF2lpAX1ZEqQd3yAxa1pr_STA-X8"
    
    func fetchPhotos(perPage: Int = 30, completion: @escaping (Result<[UnsplashPhoto], Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)?per_page=\(perPage)&client_id=\(keyID)") else {
            completion(.failure(NSError(domain: "PhotoService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        NetworkingService.shared.fetchData(from: url) { result in
            completion(result)
        }
    }
}
