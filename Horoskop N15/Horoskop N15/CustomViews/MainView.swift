//
//  MainView.swift
//  Horoskop N15
//
//  Created by Zuka Papuashvili on 10.04.24.
//

import UIKit

class MainView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "მიშა ცაგარელის ჰაბი"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel()
        label.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    //StackView and its Components:
    let verticalStackView = UIStackView()
    let zodiacNameLabel = UILabel()
    let textField = UITextField()
    let button = CustomButton()
    let spacer = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        addSubs()
        addConstraints()
        configureView()
        stackViewConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        //label:
        zodiacNameLabel.text = "ზოდიაქოს სახელი"
        zodiacNameLabel.font = .systemFont(ofSize: 16, weight: .regular)
        zodiacNameLabel.textColor = .white
        //textField:
        let placeholderText = "მაგ: ვერძი"
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: UIFont.systemFont(ofSize: 16)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .clear
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 7
        textField.textColor = .white
        //button:
        button.setTitle("შემდეგ", for: .normal)
    }
    
    private func addSubs() {
        addSubview(titleLabel)
        addSubview(bodyLabel)
        addSubview(verticalStackView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            //title:
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 71),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            //body:
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            //stackView:
            verticalStackView.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 91),
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            //button & textField
            textField.heightAnchor.constraint(equalToConstant: 48),
            button.heightAnchor.constraint(equalToConstant: 48),
            spacer.heightAnchor.constraint(equalToConstant: 25)
            
        ])
    }
    
    private func stackViewConfig() {
        //adding subs on stack:
        verticalStackView.addArrangedSubview(zodiacNameLabel)
        verticalStackView.addArrangedSubview(textField)
        verticalStackView.addArrangedSubview(spacer)
        verticalStackView.addArrangedSubview(button)
        //configuring:
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fill
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 10
    }
    
}
