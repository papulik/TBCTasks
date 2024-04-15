//
//  CardView.swift
//  ComplainHub N17
//
//  Created by Zuka Papuashvili on 14.04.24.
//

import UIKit

class CardView: UIView {
    
    //MARK: - CardView UI Properties
    //main outter vertical stack:
    let verticalStack = UIStackView()
    //outter stack elements:
    let titleLabel = UILabel()
    let titleTextField = UITextField()
    let detailsLabel = UILabel()
    let detailTextField = UITextField()
    let chooseLabel = UILabel()
    //images: for inner stack
    let imageButton1 = UIButton()
    let imageButton2 = UIButton()
    let imageButton3 = UIButton()
    let imageButton4 = UIButton()
    //inner horizontal stack:
    let horizontalStack = UIStackView()
    //spacer views for vertical stack:
    let spacer1 = UIView()
    let spacer2 = UIView()
    //spacer views for horiontal stack:
    let leadingSpacer = UIView()
    let trailingSpacer = UIView()
    //imageName:
    var selectedImageName: String?
    
    //MARK: - INIT:
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        //title:
        setupTitleAndTitleTextField()
        //details:
        setupDetailsAndDetailsTextField()
        //choose:
        setupChooseLabel()
        //Buttons:
        setupButtons()
        //Horizontal Stack:
        setupHorizontalStack()
        //Vertical Stack:
        setupVerticalStack()
        //constraints:
        configureMainStack()
    }
    
    //MARK: - Setup Title
    private func setupTitleAndTitleTextField() {
        titleLabel.text = "სათაური"
        titleLabel.font = UIFont(name: Constants.font, size: 16)
        titleLabel.textColor = .white
        //title textfield:
        titleTextField.placeholder = "მაგ: პანიკა, დახმარება მჭირდება"
        titleTextField.borderStyle = .roundedRect
        titleTextField.backgroundColor = .cellBackground
        titleTextField.layer.borderWidth = 1
        titleTextField.layer.borderColor = UIColor.gray.cgColor
        titleTextField.layer.cornerRadius = 10
        titleTextField.textColor = .white
        titleTextField.attributedPlaceholder = NSAttributedString(
            string: "Placeholder Text",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
    }
    
    //MARK: - Setup Details
    private func setupDetailsAndDetailsTextField() {
        detailsLabel.text = "აღწერა"
        detailsLabel.font = UIFont(name: Constants.font, size: 16)
        detailsLabel.textColor = .white
        //detail TextField:
        detailTextField.placeholder = "მაგ: ფიგმამ გამიჭედა და რა ვქნა"
        detailTextField.borderStyle = .roundedRect
        detailTextField.backgroundColor = .cellBackground
        detailTextField.layer.borderWidth = 1
        detailTextField.layer.borderColor = UIColor.gray.cgColor
        detailTextField.layer.cornerRadius = 10
        detailTextField.textColor = .white
        detailTextField.attributedPlaceholder = NSAttributedString(
            string: "Placeholder Text",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
    }
    
    //MARK: - Setup Choose Label and Icons
    private func setupChooseLabel() {
        chooseLabel.text = "აარჩიეთ აიქონი"
        chooseLabel.font = UIFont(name: Constants.font, size: 16)
        chooseLabel.textColor = .white
    }
    
    //MARK: - Setup Icon Buttons:
    private func setupButtons() {
        configureButton(imageButton1, withImageNamed: Constants.imageOneName)
        configureButton(imageButton2, withImageNamed: Constants.imageTwoName)
        configureButton(imageButton3, withImageNamed: Constants.imageThreeName)
        configureButton(imageButton4, withImageNamed: Constants.imageFourName)
    }
    
    //MARK: - Configure Icon Buttons:
    private func configureButton(_ button: UIButton, withImageNamed imageName: String) {
        if let image = UIImage(named: imageName) {
            button.setImage(image, for: .normal)
        }
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.cornerRadius = 12
        button.clipsToBounds = true
        button.addAction(UIAction { [weak self] action in
            self?.buttonTapped(button)
        }, for: .touchUpInside)
    }
    
    //MARK: - Icon Choose ButtonAction
    private func buttonTapped(_ button: UIButton) {
        highlightButton(button)
        switch button {
        case imageButton1:
            selectedImageName = Constants.imageOneName
        case imageButton2:
            selectedImageName = Constants.imageTwoName
        case imageButton3:
            selectedImageName = Constants.imageThreeName
        case imageButton4:
            selectedImageName = Constants.imageFourName
        default:
            break
        }
    }
    
    //MARK: - Button Custom Animation:
    private func highlightButton(_ button: UIButton) {
        // Reset all buttons
        [imageButton1, imageButton2, imageButton3, imageButton4].forEach { btn in
            btn.layer.borderWidth = 0
            btn.alpha = 0.6
        }
        
        // Highlight selected button
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.green.cgColor
        button.alpha = 1.0
    }
    
    //MARK: - Setup Main Horizontal Stack:
    private func setupHorizontalStack() {
        //subs:
        horizontalStack.addArrangedSubview(leadingSpacer)
        horizontalStack.addArrangedSubview(imageButton1)
        horizontalStack.addArrangedSubview(imageButton2)
        horizontalStack.addArrangedSubview(imageButton3)
        horizontalStack.addArrangedSubview(imageButton4)
        horizontalStack.addArrangedSubview(trailingSpacer)
        //stack:
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .equalSpacing
        horizontalStack.alignment = .center
        horizontalStack.spacing = 25
    }
    
    //MARK: - Setup Vertical Icon Stack:
    private func setupVerticalStack() {
        //stack subs:
        verticalStack.addArrangedSubview(titleLabel)
        verticalStack.addArrangedSubview(titleTextField)
        verticalStack.addArrangedSubview(spacer1)
        verticalStack.addArrangedSubview(detailsLabel)
        verticalStack.addArrangedSubview(detailTextField)
        verticalStack.addArrangedSubview(spacer2)
        verticalStack.addArrangedSubview(chooseLabel)
        verticalStack.addArrangedSubview(horizontalStack)
        //main stack:
        verticalStack.axis = .vertical
        verticalStack.distribution = .fill
        verticalStack.alignment = .fill
        verticalStack.spacing = 15
    }
    
    private func configureMainStack() {
        addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        
        //MARK: - CardView Constraints
        NSLayoutConstraint.activate([
            //main stack:
            verticalStack.topAnchor.constraint(equalTo: topAnchor),
            verticalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            //textfield heights:
            titleTextField.heightAnchor.constraint(equalToConstant: 45),
            detailTextField.heightAnchor.constraint(equalToConstant: 45),
            //vertical stack spacer heights:
            spacer1.heightAnchor.constraint(equalToConstant: 3),
            spacer2.heightAnchor.constraint(equalToConstant: 7),
            //horizontal stack spacer heights:
            leadingSpacer.widthAnchor.constraint(equalToConstant: 1),
            trailingSpacer.widthAnchor.constraint(equalToConstant: 1)
        ])
        
        let imageHeight = 40.0
        [imageButton1, imageButton2, imageButton3, imageButton4].forEach { imageView in
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalToConstant: imageHeight),
                imageView.widthAnchor.constraint(equalToConstant: imageHeight)
            ])
        }
    }
}
