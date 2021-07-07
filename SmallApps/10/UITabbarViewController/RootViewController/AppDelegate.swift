//
//  AppDelegate.swift
//  RootViewController
//
//  Created by Alexander Rubtsov on 07.07.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .blue
        vc1.tabBarItem = .init(title: "vc1", image: .init(systemName: "pencil.circle.fill"), tag: 0)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .red
        vc2.tabBarItem = .init(title: "vc2", image: .init(systemName: "pencil"), tag: 0)
        
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = [vc1, vc2]
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = tabBarVC
        window.makeKeyAndVisible()
        self.window = window
        
        
        
        
        
        return true
    }


}

