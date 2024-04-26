//
//  AvatarVC.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 26.04.24.
//

import UIKit

class AvatarVC: UIViewController {
    
    let buttonBoy = UIButton()
    let buttonGirl = UIButton()
    let vStack = UIStackView()
    let conteinerView = UIView()
    let viewModel = AvatarViewModel()
    
    weak var delegate: AvatarVCDelegate? {
        didSet {
            viewModel.delegate = delegate
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupVStack()
        constraintsUI()
        buttonActions()
    }
    
    private func buttonActions() {
        let actionBoy = UIAction { [weak self] _ in
            self?.viewModel.selectAvatarBoy()
            self?.dismiss(animated: true)
        }
        
        let actionGirl = UIAction { [weak self] _ in
            self?.viewModel.selectAvatarGirl()
            self?.dismiss(animated: true)
        }
        
        buttonBoy.addAction(actionBoy, for: .touchUpInside)
        buttonGirl.addAction(actionGirl, for: .touchUpInside)
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        view.addSubview(conteinerView)
        conteinerView.addSubview(vStack)
        conteinerView.backgroundColor = .darkMode
        conteinerView.layer.cornerRadius = 13
        
        buttonBoy.setImage(UIImage(named: "AvatarBoy"), for: .normal)
        buttonBoy.imageView?.contentMode = .scaleAspectFit
        buttonGirl.setImage(UIImage(named: "AvatarGirl"), for: .normal)
        buttonGirl.imageView?.contentMode = .scaleAspectFit
    }
    
    private func setupVStack() {
        vStack.axis = .vertical
        vStack.distribution = .fillEqually
        vStack.alignment = .fill
        vStack.spacing = 20
        
        vStack.addArrangedSubview(buttonBoy)
        vStack.addArrangedSubview(buttonGirl)
    }
    
    private func constraintsUI() {
        conteinerView.translatesAutoresizingMaskIntoConstraints = false
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            conteinerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conteinerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            conteinerView.widthAnchor.constraint(equalToConstant: 200),
            conteinerView.heightAnchor.constraint(equalToConstant: 350),
            
            vStack.centerXAnchor.constraint(equalTo: conteinerView.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: conteinerView.centerYAnchor),
            buttonBoy.heightAnchor.constraint(equalToConstant: 132),
        ])
    }
}


