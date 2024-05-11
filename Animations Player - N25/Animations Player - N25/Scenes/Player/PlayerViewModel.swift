//
//  PlayerViewModel.swift
//  Animations Player - N25
//
//  Created by Zuka Papuashvili on 11.05.24.
//

import Foundation

final class PlayerViewModel {
    
    var songName: String = "So Long, London"
    var artistName: String = "Taylor Swift"
    var isPlaying: Bool = false {
        didSet {
            onUpdate?()
        }
    }
    
    var onUpdate: (() -> Void)?
    
    func togglePlayPause() {
        isPlaying.toggle()
        onUpdate?()
    }
    
}
