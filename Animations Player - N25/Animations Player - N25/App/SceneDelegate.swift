//
//  SceneDelegate.swift
//  Animations Player - N25
//
//  Created by Zuka Papuashvili on 10.05.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let viewModel = PlayerViewModel()
        let playerVC = PlayerVC(viewModel: viewModel)
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = playerVC
        window.makeKeyAndVisible()
        
        self.window = window
    }
}

