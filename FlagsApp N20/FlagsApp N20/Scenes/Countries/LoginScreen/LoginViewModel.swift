//
//  LoginViewModel.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 26.04.24.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func didSaveCredentials(success: Bool)
    func didEncounterError(message: String)
    func didSaveImage(success: Bool, errorMessage: String?)
}

class LoginViewModel {
    weak var delegate: LoginViewModelDelegate?
    
    var isFirstLogin: Bool {
        !UserDefaults.standard.bool(forKey: "isFirstLogin")
    }
    
    //MARK: - Save Credentials
    func saveCredentials(username: String, password: String) {
        let usernameSaved = KeychainService.save(username, forKey: "username")
        let passwordSaved = KeychainService.save(password, forKey: "password")
        
        if usernameSaved && passwordSaved {
            delegate?.didSaveCredentials(success: true)
        } else {
            delegate?.didSaveCredentials(success: false)
            delegate?.didEncounterError(message: "Failed to save credentials.")
        }
    }
    
    //MARK: - Password and Repeat Password Comparison
    func validatePasswords(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
    
    //MARK: - First Login Flag
    func markFirstLogin() {
        UserDefaults.standard.set(true, forKey: "isFirstLogin")
    }
    
    //MARK: - Getting Directory URL For FileManager
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    //MARK: - Image Saving Logic From Picker
    func saveImageData(_ imageData: Data, with filename: String) {
        let filePath = getDocumentsDirectory().appendingPathComponent(filename)
        
        do {
            try imageData.write(to: filePath)
            print("Image saved at: \(filePath)")
            delegate?.didSaveImage(success: true, errorMessage: nil)
        } catch {
            print("Error saving image: \(error)")
            delegate?.didSaveImage(success: false, errorMessage: "Failed to save image to documents directory.")
        }
    }
}
