//
//  CountryModel.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 20.04.24.
//

import Foundation

struct Country: Codable {
    let name: Name?
    let flags: Flags?
    let capital: [String]?
    let currencies: [String: Currency]?
    let region: String?
    let borders: [String]?
    let maps: Maps?
    let nativeNames: [String: NativeName]?
    let altSpellings: [String]?
}

struct Maps: Codable {
    let googleMaps: String?
    let openStreetMaps: String?
}

struct Name: Codable {
    let common: String?
    let official: String?
    let nativeName: [String: NativeName]?
}

struct NativeName: Codable {
    let official: String?
    let common: String?
    let nativeName: [String: NativeName]?
}

struct Flags: Codable {
    let png: String?
    let svg: String?
    let alt: String?
}

struct Currency: Codable {
    let name: String?
    let symbol: String?
}

