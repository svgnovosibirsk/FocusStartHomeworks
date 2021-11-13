//
//  SceneDelegate.swift
//  myCV
//
//  Created by Sergey Golovin on 13.11.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let scene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: scene)
            let tabBarController = createTabBarController()
            window.rootViewController = tabBarController
            self.window = window
            self.window?.makeKeyAndVisible()
        }
    }
}

private extension SceneDelegate {
    func createTabBarController() -> UITabBarController {
        let tabBar = UITabBarController()
        let mainInfoVC = MainInfoViewController()
        let experienceVC = ExperienceViewController()
        let hobbyVC = HobbyViewController()
        mainInfoVC.tabBarItem = createMainInfoVCTab()
        experienceVC.tabBarItem = createExperienceVCTab()
        hobbyVC.tabBarItem = createHobbyVCTab()
        
        tabBar.setViewControllers([mainInfoVC, experienceVC, hobbyVC], animated: false)
        
        return tabBar
    }
    
    func createMainInfoVCTab() -> UITabBarItem {
        let item = UITabBarItem(title: "", image: UIImage(systemName: "person.fill"), tag: 0)
        return item
    }
    
    func createExperienceVCTab() -> UITabBarItem {
        let item = UITabBarItem(title: "", image: UIImage(systemName: "desktopcomputer"), tag: 1)
        item.badgeColor = .gray
        return item
    }
    
    func createHobbyVCTab() -> UITabBarItem {
        let item = UITabBarItem(title: "", image: UIImage(systemName: "bicycle"), tag: 2)
        return item
    }
}
