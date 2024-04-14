//
//  BackGroundImage.swift
//  ComplainHub N17
//
//  Created by Zuka Papuashvili on 13.04.24.
//

import UIKit

class BackGroundImage: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        image = UIImage(named: "Rectangle 1")
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
