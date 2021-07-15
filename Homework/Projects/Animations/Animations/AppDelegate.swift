//
//  AppDelegate.swift
//  Animations
//
//  Created by Alexander Rubtsov on 15.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = AnimationsViewController()
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
}

