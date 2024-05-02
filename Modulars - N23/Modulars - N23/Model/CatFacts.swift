//
//  CatFacts.swift
//  Modulars - N23
//
//  Created by Zuka Papuashvili on 01.05.24.
//

import Foundation

struct CatFact: Codable {
    var fact: String
    var length: Int
}

struct FactsResponse: Codable {
    var data: [CatFact]
    var last_page: Int
    var current_page: Int
    var total: Int

    enum CodingKeys: String, CodingKey {
        case data = "data"
        case last_page, current_page, total
    }
}
