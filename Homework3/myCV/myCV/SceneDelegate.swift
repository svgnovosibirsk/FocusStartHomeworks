//
//  SceneDelegate.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let scene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: scene)
            let tabBarControllerGenerator = TabBarControllerGenerator()
            let tabBarController = tabBarControllerGenerator.createTabBarController()
            window.rootViewController = tabBarController
            self.window = window
            self.window?.makeKeyAndVisible()
        }
    }
}
