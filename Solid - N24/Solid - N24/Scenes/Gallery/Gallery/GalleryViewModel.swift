//
//  GalleryViewModel.swift
//  Solid - N24
//
//  Created by Zuka Papuashvili on 08.05.24.
//

import Foundation

class GalleryViewModel {
    
    //MARK: - Callback trigger
    var onUpdate: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    //MARK: - Photo Service
    private let photoService: PhotoService
    
    private(set) var items: [Item] = [] {
        didSet {
            onUpdate?()
        }
    }
    
    init(photoService: PhotoService = PhotoService()) {
        self.photoService = photoService
    }
    
    //MARK: - Photo Loader
    func loadPhotos() {
        photoService.fetchPhotos { [weak self] result in
            switch result {
            case .success(let photos):
                self?.items = photos.map { Item(photo: $0) }
                self?.onUpdate?()
            case .failure(let error):
                self?.onError?(error)
            }
        }
    }
}


