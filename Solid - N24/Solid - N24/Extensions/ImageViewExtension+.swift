//
//  ImageViewExtension+.swift
//  Solid - N24
//
//  Created by Zuka Papuashvili on 08.05.24.
//

import UIKit

extension UIImageView {
    func setImage(from urlString: String, downloader: ImageDownloaderProtocol = ImageDownloader.shared) {
        downloader.loadImage(from: urlString) { [weak self] image in
            DispatchQueue.main.async {
                self?.image = image
            }
        }
    }
}

