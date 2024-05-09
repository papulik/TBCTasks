//
//  PhotosModel.swift
//  Solid - N24
//
//  Created by Zuka Papuashvili on 08.05.24.
//

import Foundation

struct UnsplashPhoto: Codable {
    let urls: Urls
}

struct Urls: Codable {
    let raw, full, regular, small, thumb: String
}
