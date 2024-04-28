//
//  SceneDelegate.swift
//  FlagsApp N20
//
//  Created by Zuka Papuashvili on 20.04.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        if KeychainService.retrieve(forKey: "username") != nil,
           KeychainService.retrieve(forKey: "password") != nil {
            let countriesVC = CountriesVC()
            let navigationController = UINavigationController(rootViewController: countriesVC)
            window?.rootViewController = navigationController
        } else {
            let loginVC = LoginVC()
            let navigationController = UINavigationController(rootViewController: loginVC)
            window?.rootViewController = navigationController
        }
        window?.makeKeyAndVisible()
        
    }
    
}

