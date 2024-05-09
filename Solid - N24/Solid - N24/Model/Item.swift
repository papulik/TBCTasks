//
//  Item.swift
//  Solid - N24
//
//  Created by Zuka Papuashvili on 08.05.24.
//

import Foundation

struct Item: Hashable {
    let identifier = UUID()
    let photo: UnsplashPhoto

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}
