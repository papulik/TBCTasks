//
//  LoginVC.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 25.04.24.
//

import UIKit

class LoginVC: UIViewController {
    let login = LoginView()
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        setupUI()
        avatarActions()
        buttonActions()
        setupGalleryButton()
    }
    
    func setupUI() {
        view = login
    }
    
    func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }

    func setupGalleryButton() {
        let action = UIAction { [weak self] _ in
            self?.presentImagePicker()
        }
        login.galleryImage.addAction(action, for: .touchUpInside)
    }
    
    func avatarActions() {
        let action = UIAction { [weak self] _ in
            guard let self = self else { return }
            let avatarVC = AvatarVC()
            avatarVC.delegate = self
            avatarVC.modalPresentationStyle = .custom
            self.present(avatarVC, animated: true)
        }
        login.avatarImageButton.addAction(action, for: .touchUpInside)
    }
    
    func buttonActions() {
        let action = UIAction { [weak self] _ in
            guard let self = self else { return }
            
            let username = self.login.mStack.topVStack.textField.text ?? ""
            let password = self.login.mStack.middleVStack.textField.text ?? ""
            let repeatPassword = self.login.mStack.bottomVStack.textField.text ?? ""
            
            if viewModel.validatePasswords(password: password, repeatPassword: repeatPassword) {
                viewModel.saveCredentials(username: username, password: password)
            } else {
                showErrorAlert("Passwords do not match.")
            }
        }
        
        login.mStack.loginButton.addAction(action, for: .touchUpInside)
    }
    
    func showSuccessAlert(_ message: String) {
        let successAlert = UIAlertController(
            title: "სურათი წარმატებით შეინახა",
            message: message,
            preferredStyle: .alert
        )
        successAlert.addAction(UIAlertAction(title: "OK", style: .default))
        DispatchQueue.main.async {
            self.present(successAlert, animated: true)
        }
    }
    
    func showErrorAlert(_ message: String) {
        let errorAlert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        errorAlert.addAction(UIAlertAction(title: "OK", style: .default))
        DispatchQueue.main.async {
            self.present(errorAlert, animated: true)
        }
    }
}

//MARK: - Extensions:
extension LoginVC: LoginViewModelDelegate {
    
    func didSaveCredentials(success: Bool) {
        if success {
            if viewModel.isFirstLogin {
                viewModel.markFirstLogin()
            }
            navigateToCountriesVC()
        }
    }
    
    func didEncounterError(message: String) {
        showErrorAlert(message)
    }
    
    func navigateToCountriesVC() {
        let countriesVC = CountriesVC()
        navigationController?.pushViewController(countriesVC, animated: true)
    }
    
    func didSaveImage(success: Bool, errorMessage: String?) {
        if success {
            print("didSaveImage called with success: \(success)")
            showSuccessAlert("Image saved successfully.")
        } else {
            showErrorAlert(errorMessage ?? "Unknown error occurred.")
        }
    }
}

extension LoginVC: AvatarVCDelegate {
    func avatarVCDidSelectImage(selectedImage: UIImage) {
        login.avatarImageButton.setImage(selectedImage, for: .normal)
    }
}

extension LoginVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        if let selectedImage = info[.originalImage] as? UIImage {
            login.galleryImage.layer.masksToBounds = true
            login.galleryImage.layer.cornerRadius = 65
            login.galleryImage.setImage(selectedImage, for: .normal)
            
            viewModel.saveImageToDocumentsDirectory(image: selectedImage, with: "gallery_image.png")
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
