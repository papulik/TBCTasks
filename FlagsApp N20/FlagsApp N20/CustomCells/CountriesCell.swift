//
//  CountriesCell.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 20.04.24.
//

import UIKit

class CountriesCell: UITableViewCell {
    
    //MARK: - Cell Properties
    let flagImage = UIImageView()
    let countryName = UILabel()
    let customDisclosureIndicator = UIImageView(image: UIImage(systemName: "chevron.right"))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Cell Setup
    func setupCell() {
        backgroundColor = .darkMode
        accessoryType = .none
        selectionStyle = .none
        //subviews
        contentView.addSubview(flagImage)
        contentView.addSubview(countryName)
        contentView.addSubview(customDisclosureIndicator)
        //resizing:
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        countryName.translatesAutoresizingMaskIntoConstraints = false
        customDisclosureIndicator.translatesAutoresizingMaskIntoConstraints = false
        //image:
        flagImage.contentMode = .scaleAspectFill
        //country:
        countryName.textAlignment = .center
        countryName.font = .systemFont(ofSize: 14, weight: .semibold)
        countryName.textColor = .label
        //disclosure:
        customDisclosureIndicator.tintColor = .gray
        //Configure contentView
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1.5
        contentView.layer.borderColor = UIColor.borderDarkMode.cgColor
        contentView.clipsToBounds = true
        //Constraints
        cellConstraints()
    }
    
    //MARK: - Cell Constraints:
    func cellConstraints() {
        NSLayoutConstraint.activate([
            //image:
            flagImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            flagImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            flagImage.heightAnchor.constraint(equalToConstant: 20),
            flagImage.widthAnchor.constraint(equalToConstant: 30),
            //country:
            countryName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 17),
            countryName.leadingAnchor.constraint(equalTo: flagImage.trailingAnchor, constant: 10),
            countryName.trailingAnchor.constraint(equalTo: customDisclosureIndicator.leadingAnchor, constant: -10),
            countryName.heightAnchor.constraint(equalToConstant: 20),
            //disclosure: >
            customDisclosureIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            customDisclosureIndicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            customDisclosureIndicator.widthAnchor.constraint(equalToConstant: 10),
            customDisclosureIndicator.heightAnchor.constraint(equalToConstant: 16)
        ])
    }
}
