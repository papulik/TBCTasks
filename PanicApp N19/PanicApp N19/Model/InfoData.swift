//
//  InfoData.swift
//  PanicApp N19
//
//  Created by Zuka Papuashvili on 19.04.24.
//

import Foundation

struct InfoData: Codable {
    let list: [NewsItem]
    
    enum CodingKeys: String, CodingKey {
        case list = "List"
    }
}

struct NewsItem: Codable {
    let title: String
    let time: String
    let url: URL
    let type: Int
    let photoUrl: URL
    let photoAlt: String
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case time = "Time"
        case url = "Url"
        case type = "Type"
        case photoUrl = "PhotoUrl"
        case photoAlt = "PhotoAlt"
    }
}
