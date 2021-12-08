//
//  SceneDelegate.swift
//  TableViewApp1
//
//  Created by Sergey Golovin on 18.11.2021.
//

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let navigationVC = UINavigationController(rootViewController: ViewController())
            window.rootViewController = navigationVC
            self.window = window
            self.window?.makeKeyAndVisible()
        }
    }
}

