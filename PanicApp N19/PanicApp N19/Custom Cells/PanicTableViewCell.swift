//
//  PanicTableViewCell.swift
//  PanicApp N19
//
//  Created by Zuka Papuashvili on 19.04.24.
//

import UIKit

class PanicTableViewCell: UITableViewCell {
    
    //MARK: Cell Properties
    let backgroundImage = UIImageView()
    let infoLabel = UILabel()
    let timeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupCell:
    func setupCell() {
        //subs:
        contentView.addSubview(backgroundImage)
        contentView.addSubview(infoLabel)
        contentView.addSubview(timeLabel)
        //resizing:
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        //backgroundImage:
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true
        backgroundImage.layer.cornerRadius = 15
        //info:
        infoLabel.numberOfLines = 3
        infoLabel.textAlignment = .center
        infoLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        infoLabel.textColor = .white
        //time:
        timeLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        timeLabel.textAlignment = .center
        timeLabel.textColor = .white
        //constraints:
        cellConstraints()
    }
    
    //MARK: Cell Constraints:
    func cellConstraints() {
        NSLayoutConstraint.activate([
            // Constraints for backgroundImage:
            backgroundImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            // Constraints for timeLabel:
            timeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            timeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            // Constraints for infoLabel:
            infoLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            infoLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -16)
        ])
    }
}
