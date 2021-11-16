//
//  TabBarControllerGenerator.swift
//  myCV
//
//  Created by Sergey Golovin on 16.11.2021.
//

import UIKit

final class TabBarControllerGenerator {
    static let instance = TabBarControllerGenerator()
    
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
    
  
}

private extension TabBarControllerGenerator {
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
