//
//  CustomImageView.swift
//  Horoskop N15
//
//  Created by Zuka Papuashvili on 10.04.24.
//

import UIKit

class CustomImageView: UIImageView {
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImageView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureImageView()
    }
    
    private func configureImageView() {
        self.image = UIImage(named: "Image")
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
}
