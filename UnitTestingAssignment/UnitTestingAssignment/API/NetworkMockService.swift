//
//  NetworkMockService.swift
//  UnitTestingAssignment
//
//  Created by Zuka Papuashvili on 12.05.24.
//

import Foundation

class MockNetworkManager: NetworkManagerProtocol {
    
    var products: [Product]?
    var error: Error?
    
    func fetchProducts(completion: @escaping (Result<[Product]?, any Error>) -> Void) {
        if let error = error {
            completion(.failure(error))
        } else if let products = products {
            completion(.success(products))
        } else {
            completion(.failure(NSError(domain: "No products available", code: 0, userInfo: nil)))
        }
    }
}
