//
//  SceneDelegate.swift
//  ZeroWaste
//
//  Created by 한상진 on 2021/04/17.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        
        let vc = ViewController()
        
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}

