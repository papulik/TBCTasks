//
//  DetailsTableViewCell.swift
//  Contacts N16
//
//  Created by Zuka Papuashvili on 12.04.24.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {
    
    let leftTextLabel = UILabel()
    let rightTextLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLabels()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLabels() {
        contentView.addSubview(leftTextLabel)
        contentView.addSubview(rightTextLabel)
        rightTextLabel.translatesAutoresizingMaskIntoConstraints = false
        leftTextLabel.translatesAutoresizingMaskIntoConstraints = false
        //leftLabel:
        leftTextLabel.textColor = .black
        leftTextLabel.font = .systemFont(ofSize: 17)
        //rightLabel:
        rightTextLabel.textColor = .black
        rightTextLabel.font = .systemFont(ofSize: 17)
        rightTextLabel.textAlignment = .right
        
        NSLayoutConstraint.activate([
            // Constraints for leftTextLabel
            leftTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            leftTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            // Constraints for rightTextLabel
            rightTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            rightTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}

