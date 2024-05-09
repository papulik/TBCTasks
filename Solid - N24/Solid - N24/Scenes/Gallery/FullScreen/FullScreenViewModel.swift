//
//  FullScreenViewModel.swift
//  Solid - N24
//
//  Created by Zuka Papuashvili on 08.05.24.
//

import Foundation

class FullScreenViewModel {
    
    //MARK: - Buisness Logic Variables
    var items: [Item] = []
    var initialIndex: Int = 0
    
    //MARK: - Init
    init(items: [Item], initialIndex: Int) {
        self.items = items
        self.initialIndex = initialIndex
    }
    
    //MARK: - Item 
    func item(at indexPath: IndexPath) -> Item? {
        guard indexPath.row < items.count else { return nil }
        return items[indexPath.row]
    }
}
