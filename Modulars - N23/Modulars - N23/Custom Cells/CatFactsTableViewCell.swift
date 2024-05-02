//
//  CatFactsTableViewCell.swift
//  Modulars - N23
//
//  Created by Zuka Papuashvili on 01.05.24.
//

import UIKit

class CatFactsTableViewCell: UITableViewCell {

    let factsLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupFactsLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupFactsLabel() {
        backgroundColor = .lightGray
        contentView.addSubview(factsLabel)
        factsLabel.numberOfLines = 0
        factsLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            factsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            factsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            factsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            factsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
}
