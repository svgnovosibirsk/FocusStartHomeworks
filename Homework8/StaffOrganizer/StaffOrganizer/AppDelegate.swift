//
//  AppDelegate.swift
//  StaffOrganizer
//
//  Created by Sergey Golovin on 16.12.2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        StaffModel.shared.saveContext()
    }
}

