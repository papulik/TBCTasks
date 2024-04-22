//
//  DetailView.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 20.04.24.
//

import UIKit

class DetailView: UIView {
    
    //MARK: - UI Properties:
    let flagImage = UIImageView()
    let aboutFlag = UILabel()
    let aboutFlagBody = UILabel()
    let lineView = UIView()
    let basicInfo = UILabel()
    let customStack = CustomVerticalStack()
    let lineView2 = UIView()
    let linksLabel = UILabel()
    let linksStack = CustomButtonLinks()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Details Setup
    private func setupUI() {
        //subs:
        addSubview(flagImage)
        addSubview(aboutFlag)
        addSubview(aboutFlagBody)
        addSubview(lineView)
        addSubview(basicInfo)
        addSubview(customStack)
        addSubview(lineView2)
        addSubview(linksLabel)
        addSubview(linksStack)
        //resizing:
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        aboutFlag.translatesAutoresizingMaskIntoConstraints = false
        aboutFlagBody.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        basicInfo.translatesAutoresizingMaskIntoConstraints = false
        customStack.translatesAutoresizingMaskIntoConstraints = false
        lineView2.translatesAutoresizingMaskIntoConstraints = false
        linksLabel.translatesAutoresizingMaskIntoConstraints = false
        linksStack.translatesAutoresizingMaskIntoConstraints = false
        //image:
        flagImage.clipsToBounds = false
        flagImage.layer.cornerRadius = 15
        flagImage.contentMode = .scaleAspectFill
        //Shadow properties:
        flagImage.layer.shadowColor = UIColor.black.cgColor
        flagImage.layer.shadowOffset = CGSize(width: 0, height: 5)
        flagImage.layer.shadowOpacity = 0.6
        flagImage.layer.shadowRadius = 5.0
        //aboutFlag:
        aboutFlag.font = .systemFont(ofSize: 16, weight: .bold)
        //aboutFlagBody:
        aboutFlagBody.textAlignment = .natural
        aboutFlagBody.font = .systemFont(ofSize: 16, weight: .regular)
        aboutFlagBody.numberOfLines = 0
        //lineView
        lineView.backgroundColor = .lightGray
        //basicInfo
        basicInfo.font = .systemFont(ofSize: 16, weight: .bold)
        basicInfo.text = "Basic Information:"
        //customStack:
        customStack.native.text = "Native Name:"
        customStack.spelling.text = "Spelling"
        customStack.capital.text = "Capital:"
        customStack.currency.text = "Currency:"
        customStack.region.text = "Region:"
        customStack.neighbors.text = "Neighbors:"
        //lineView2:
        lineView2.backgroundColor = .lightGray
        //linksLabel:
        linksLabel.text = "Useful Links:"
        linksLabel.font = .monospacedDigitSystemFont(ofSize: 16, weight: .bold)
        //LinkButtons:
        linksStack.linkButton1.setTitle("", for: .normal)
        linksStack.linkButton2.setTitle("", for: .normal)
        //constraints:
        constraintsUI()
    }
    
    //MARK: Details Constraints:
    private func constraintsUI(){
        NSLayoutConstraint.activate([
            //image:
            flagImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            flagImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            flagImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            flagImage.heightAnchor.constraint(equalToConstant: 190),
            //flaginfo:
            aboutFlag.topAnchor.constraint(equalTo: flagImage.bottomAnchor, constant: 20),
            aboutFlag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            aboutFlag.heightAnchor.constraint(equalToConstant: 50),
            //body:
            aboutFlagBody.topAnchor.constraint(equalTo: aboutFlag.bottomAnchor, constant: 10),
            aboutFlagBody.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 36),
            aboutFlagBody.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -36),
            //line:
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.topAnchor.constraint(equalTo: aboutFlagBody.bottomAnchor, constant: 24),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            //basicInfo:
            basicInfo.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 24),
            basicInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            basicInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -204),
            //stack:
            customStack.topAnchor.constraint(equalTo: basicInfo.bottomAnchor, constant: 20),
            customStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            customStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            //line2:
            lineView2.heightAnchor.constraint(equalToConstant: 1),
            lineView2.topAnchor.constraint(equalTo: customStack.bottomAnchor, constant: 20),
            lineView2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            lineView2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            //links:
            linksLabel.topAnchor.constraint(equalTo: lineView2.bottomAnchor, constant: 24),
            linksLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            linksLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -204),
            //buttons:
            linksStack.topAnchor.constraint(equalTo: linksLabel.bottomAnchor, constant: 15),
            linksStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 94),
            linksStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -94),
            linksStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            // Additional constraints to control button size
            linksStack.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}


