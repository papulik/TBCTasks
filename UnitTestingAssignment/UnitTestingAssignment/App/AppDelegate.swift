//
//  AppDelegate.swift
//  UnitTestingAssignment
//
//  Created by Chuck Norris on 11.05.1992.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .orange
        
        let networkManager = NetworkManager.shared
        let cartViewModel = CartViewModel(networkManager: networkManager)
        
        let viewController = ViewController(cartViewModel: cartViewModel)
        
        window?.rootViewController = viewController
        
        return true
    }
    
}
