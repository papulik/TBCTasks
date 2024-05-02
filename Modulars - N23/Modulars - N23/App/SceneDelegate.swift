//
//  SceneDelegate.swift
//  Modulars - N23
//
//  Created by Zuka Papuashvili on 01.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let vc = CatFactsVC()
        let window = UIWindow(windowScene: scene)
        window.rootViewController = vc
        self.window = window
        window.makeKeyAndVisible()
    }
    
}
