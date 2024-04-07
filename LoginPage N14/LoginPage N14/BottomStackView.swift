//
//  BottomStackView.swift
//  LoginPage N14
//
//  Created by Zuka Papuashvili on 07.04.24.
//

import UIKit

class BottomStackView: UIStackView {
    let nameLabel = UILabel()
    let nameTextField = UITextField()
    let mailLabel = UILabel()
    let mailTextField = UITextField()
    let passwordLabel = UILabel()
    let passwordTextField = UITextField()
    let enterButton = UIButton()
    //horizontal StackView elements:
    let line1 = UIView()
    let andLabel = UILabel()
    let line2 = UIView()
    let horizontalStackView = UIStackView()
    //bottom buttons:
    let googleButton = UIButton()
    let facebookButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .vertical
        spacing = 8
        distribution = .fill
        addingSubViews()
        setupStack()
        setupStackConstraints()
        setupHorizontalStack()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addingSubViews() {
        // Add Subviews Till Horizontal Stackview:
        let subviews = [nameLabel, nameTextField, mailLabel, mailTextField, passwordLabel, passwordTextField, enterButton]
        
        for subview in subviews {
            addArrangedSubview(subview)
            subview.translatesAutoresizingMaskIntoConstraints = false
        }
        
        // flexible height for first SpacerView
        addFlexibleSpacerView(minHeight: 8, optimalHeight: 16)
        
        // Add the button after the spacer view
        addArrangedSubview(enterButton)
        
        addFlexibleSpacerView(minHeight: 6, optimalHeight: 24)
        
        addArrangedSubview(horizontalStackView)
        
        addFlexibleSpacerView(minHeight: 6, optimalHeight: 24)
        
        // google and facebook buttons.
        addArrangedSubview(googleButton)
        addArrangedSubview(facebookButton)
    }
    
    // horizontal StackView setup:
    private func setupHorizontalStack() {
        horizontalStackView.axis = .horizontal
        horizontalStackView.distribution = .equalCentering
        horizontalStackView.alignment = .center
        horizontalStackView.spacing = 2
        
        // adding subviews in inner HorizontalStackView
        horizontalStackView.addArrangedSubview(line1)
        horizontalStackView.addArrangedSubview(andLabel)
        horizontalStackView.addArrangedSubview(line2)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        // line1, ან, line2, parameters:
        line1.backgroundColor = .lightGray
        line2.backgroundColor = .lightGray
        andLabel.text = "ან"
        andLabel.font = .systemFont(ofSize: 14)
        
        let line1Width = line1.widthAnchor.constraint(equalToConstant: 150)
        line1Width.priority = .defaultHigh
        line1Width.isActive = true
        
        let line2Width = line2.widthAnchor.constraint(equalToConstant: 150)
        line2Width.priority = .defaultHigh
        line2Width.isActive = true
        
        
        NSLayoutConstraint.activate([
            line1.heightAnchor.constraint(equalToConstant: 2),
            line2.heightAnchor.constraint(equalToConstant: 2),
            andLabel.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
    
    private func setupStack() {
        //name:
        nameLabel.text = "სრული სახელი"
        nameLabel.font = .systemFont(ofSize: 14, weight: .regular)
        nameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        nameTextField.placeholder = "მაგ: ქეთინო ფერი"
        nameTextField.borderStyle = .roundedRect
        //mail:
        mailLabel.text = "ელ. ფოსტა"
        mailLabel.font = .systemFont(ofSize: 14, weight: .regular)
        mailLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        mailTextField.placeholder = "მაგ: kusuna@mail.ru"
        mailTextField.borderStyle = .roundedRect
        mailTextField.addTarget(self, action: #selector(validateEmailField), for: .editingDidEnd)
        //password:
        passwordLabel.text = "პაროლი"
        passwordLabel.font = .systemFont(ofSize: 14, weight: .regular)
        passwordLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        passwordTextField.placeholder = "მაგ: busuna123, jajanaIsMyKumiri2010"
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.isSecureTextEntry = true
        passwordTextField.addTarget(self, action: #selector(validatePasswordField), for: .editingChanged)
        //entring button:
        enterButton.setTitle("შესვლა", for: .normal)
        enterButton.backgroundColor = UIColor(red: 51/255.0, green: 165/255.0, blue: 229/255.0, alpha: 1)
        enterButton.layer.cornerRadius = 15
        //google button:
        googleButton.setTitle("გამოიყენეთ გუგლი", for: .normal)
        googleButton.setImage(UIImage(systemName: "g.circle.fill"), for: .normal)
        googleButton.tintColor = .black
        googleButton.setTitleColor(.black, for: .normal)
        googleButton.backgroundColor = .lightGray
        googleButton.layer.cornerRadius = 15
        //facebook button:
        facebookButton.setTitle("გამოიყენეთ ფეიზბურგი", for: .normal)
        facebookButton.setImage(UIImage(systemName: "f.circle.fill"), for: .normal)
        facebookButton.tintColor = .black
        facebookButton.setTitleColor(.black, for: .normal)
        facebookButton.backgroundColor = .lightGray
        facebookButton.layer.cornerRadius = 15
    }
    
    func setupStackConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.heightAnchor.constraint(equalToConstant: 46),
            mailTextField.heightAnchor.constraint(equalToConstant: 46),
            passwordTextField.heightAnchor.constraint(equalToConstant: 46),
            enterButton.heightAnchor.constraint(equalToConstant: 46),
            googleButton.heightAnchor.constraint(equalToConstant: 46),
            facebookButton.heightAnchor.constraint(equalToConstant: 46)
        ])
    }
    
    private func addFlexibleSpacerView(minHeight: CGFloat, optimalHeight: CGFloat? = nil) {
        let spacerView = UIView()
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        addArrangedSubview(spacerView)
        
        // Minimum height constraint:
        let minHeightConstraint = spacerView.heightAnchor.constraint(greaterThanOrEqualToConstant: minHeight)
        minHeightConstraint.priority = .defaultHigh
        minHeightConstraint.isActive = true
        
        // Optimal height constraint:
        if let optimalHeight = optimalHeight {
            let optimalHeightConstraint = spacerView.heightAnchor.constraint(equalToConstant: optimalHeight)
            optimalHeightConstraint.priority = .defaultLow
            optimalHeightConstraint.isActive = true
        }
    }
    //MARK: - TextField Mail Formater:
    
    @objc private func validateEmailField() {
        if let email = mailTextField.text, !email.isEmpty, !isValidEmail(email: email) {
            mailTextField.layer.borderColor = UIColor.red.cgColor
            mailTextField.layer.borderWidth = 1
        } else {
            mailTextField.layer.borderColor = UIColor.clear.cgColor
            mailTextField.layer.borderWidth = 1
        }
    }
    
    // func that filters text
    private func isValidEmail(email: String?) -> Bool {
        guard let email = email else { return false }
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    //MARK: - TextField Password Formater:
    
    @objc private func validatePasswordField() {
        if let password = passwordTextField.text, (password.count < 6 && password.count > 0 || password.count > 15) {
            passwordTextField.layer.borderColor = UIColor.red.cgColor
            passwordTextField.layer.borderWidth = 1
        } else {
            passwordTextField.layer.borderColor = UIColor.clear.cgColor
            passwordTextField.layer.borderWidth = 1
        }
    }
}

#Preview {
    BottomStackView(frame: .zero)
}
