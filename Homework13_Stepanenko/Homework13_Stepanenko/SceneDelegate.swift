//
//  SceneDelegate.swift
//  Homework13_Stepanenko
//
//  Created by Илья Степаненко on 16.04.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let mainViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
