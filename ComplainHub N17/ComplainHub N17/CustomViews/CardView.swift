//
//  CardView.swift
//  ComplainHub N17
//
//  Created by Zuka Papuashvili on 14.04.24.
//

import UIKit

class CardView: UIView {
    
    //main outter vertical stack:
    let verticalStack = UIStackView()
    //outter stack elements:
    let titleLabel = UILabel()
    let titleTextField = UITextField()
    let detailsLabel = UILabel()
    let detailTextField = UITextField()
    let chooseLabel = UILabel()
    //images: for inner stack
    let image1 = UIImageView()
    let image2 = UIImageView()
    let image3 = UIImageView()
    let image4 = UIImageView()
    //inner horizontal stack:
    let horizontalStack = UIStackView()
    //spacer views for vertical stack:
    let spacer1 = UIView()
    let spacer2 = UIView()
    //spacer views for horiontal stack:
    let leadingSpacer = UIView()
    let trailingSpacer = UIView()
    //closure too inform vc:
    var selectedImageName: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupGestureRecognizers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        //MARK: - Setup Title
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
        
        //MARK: - Setup Details
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
        
        //MARK: - Setup Choose Label and Icons
        chooseLabel.text = "აარჩიეთ აიქონი"
        chooseLabel.font = UIFont(name: Constants.font, size: 16)
        chooseLabel.textColor = .white
        //images:
        image1.image = UIImage(named: Constants.imageOneName)
        image2.image = UIImage(named: Constants.imageTwoName)
        image3.image = UIImage(named: Constants.imageThreeName)
        image4.image = UIImage(named: Constants.imageFourName)
        image1.contentMode = .scaleAspectFit
        image2.contentMode = .scaleAspectFit
        image3.contentMode = .scaleAspectFit
        image4.contentMode = .scaleAspectFit
        
        //MARK: - Setup Horizontal & Vertical Stacks
        setupHorizontalStack()
        //Vertical Stack:
        setupVerticalStack()
        //constraints:
        configureMainStack()
    }
    
    func setupHorizontalStack() {
        //subs:
        horizontalStack.addArrangedSubview(leadingSpacer)
        horizontalStack.addArrangedSubview(image1)
        horizontalStack.addArrangedSubview(image2)
        horizontalStack.addArrangedSubview(image3)
        horizontalStack.addArrangedSubview(image4)
        horizontalStack.addArrangedSubview(trailingSpacer)
        //stack:
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .equalSpacing
        horizontalStack.alignment = .center
        horizontalStack.spacing = 25
        
    }
    
    func setupVerticalStack() {
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
    
    func configureMainStack() {
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
        [image1, image2, image3, image4].forEach { imageView in
            NSLayoutConstraint.activate([
                imageView.heightAnchor.constraint(equalToConstant: imageHeight),
                imageView.widthAnchor.constraint(equalToConstant: imageHeight)
            ])
        }
    }
    
    //MARK: - Icon Gesture Highlighters:
    func setupGestureRecognizers() {
        [image1, image2, image3, image4].forEach { imageView in
            imageView.isUserInteractionEnabled = true // Enable user interaction
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleImageTap(_:))))
        }
    }
    
    //MARK: - Selected Icon Image Names
    @objc func handleImageTap(_ gesture: UITapGestureRecognizer) {
        if let selectedImageView = gesture.view as? UIImageView {
            highlightImageView(selectedImageView)
            switch selectedImageView {
            case image1:
                selectedImageName = Constants.imageOneName
            case image2:
                selectedImageName = Constants.imageTwoName
            case image3:
                selectedImageName = Constants.imageThreeName
            case image4:
                selectedImageName = Constants.imageFourName
            default:
                break
            }
        }
    }
    
    func highlightImageView(_ imageView: UIImageView) {
        // Reset all images
        [image1, image2, image3, image4].forEach { img in
            img.layer.borderWidth = 0
            img.alpha = 0.6
        }
        
        // Highlight selected image
        imageView.layer.cornerRadius = 12
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.green.cgColor
        imageView.alpha = 1.0
    }
    
}
