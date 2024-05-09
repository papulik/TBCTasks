//
//  ImageDownloader.swift
//  Solid - N24
//
//  Created by Zuka Papuashvili on 09.05.24.
//

import UIKit

protocol ImageDownloaderProtocol {
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void)
}

final class ImageDownloader: ImageDownloaderProtocol {
    static let shared = ImageDownloader()
    private let cache = NSCache<NSString, UIImage>()
    
    func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        let urlNSString = urlString as NSString
        if let cachedImage = cache.object(forKey: urlNSString) {
            completion(cachedImage)
            return
        }

        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, let newImage = UIImage(data: data), error == nil else {
                print("Error downloading the image: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            
            self.cache.setObject(newImage, forKey: urlNSString)
            completion(newImage)
        }.resume()
    }
}
