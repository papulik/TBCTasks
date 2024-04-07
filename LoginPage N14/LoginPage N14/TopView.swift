//
//  topView.swift
//  LoginPage N14
//
//  Created by Zuka Papuashvili on 06.04.24.
//

import UIKit

class TopView: UIView {
    
    let imageView = UIImageView()
    let greetingsLabel = UILabel()
    let bodyLabel = UILabel()
    let tabMenuLabel = UILabel()
    let line = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupTopViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        // Adding subViews:
        addSubview(imageView)
        addSubview(greetingsLabel)
        addSubview(bodyLabel)
        addSubview(tabMenuLabel)
        addSubview(line)
        // Disable AutoResizing:
        imageView.translatesAutoresizingMaskIntoConstraints = false
        greetingsLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        tabMenuLabel.translatesAutoresizingMaskIntoConstraints = false
        line.translatesAutoresizingMaskIntoConstraints = false
        // Describe image:
        imageView.image = UIImage(systemName: "lock.laptopcomputer")
        imageView.tintColor = .black
        // Describe greetingsLabel:
        greetingsLabel.text = "მოგესალმებით!"
        greetingsLabel.font = .systemFont(ofSize: 24, weight: .regular)
        // Describe bodyLabel
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 1 // Adjust line spacing to your preference
        let attributedString = NSAttributedString(string: "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია.", attributes: [
            .paragraphStyle: paragraphStyle,
            .font: UIFont.systemFont(ofSize: 14, weight: .thin)
        ])

        bodyLabel.attributedText = attributedString
        bodyLabel.numberOfLines = 0
        //Describe TabMenu Label:
        tabMenuLabel.text = "ავტორიზაცია"
        tabMenuLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        tabMenuLabel.textColor = .darkText
        //Describe Line:
        line.backgroundColor = UIColor(red: 51/255.0, green: 165/255.0, blue: 229/255.0, alpha: 1)
        
    }
    
    private func setupTopViewConstraints() {
        NSLayoutConstraint.activate([
            //image constraints:
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageView.widthAnchor.constraint(equalToConstant: 90),
            imageView.heightAnchor.constraint(equalToConstant: 50),
            //greetings constraints:
            greetingsLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            greetingsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            greetingsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            //body contraints:
            bodyLabel.topAnchor.constraint(equalTo: greetingsLabel.bottomAnchor, constant: 4),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            //tabMenu constrains:
            tabMenuLabel.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 30),
            tabMenuLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            //line constraints:
            line.topAnchor.constraint(equalTo: tabMenuLabel.bottomAnchor, constant: 10),
            line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.5),
            line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.5),
            line.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            line.heightAnchor.constraint(equalToConstant: 2)
        ])
        
    }
}
