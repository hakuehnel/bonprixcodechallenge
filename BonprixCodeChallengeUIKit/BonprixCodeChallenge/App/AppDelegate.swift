//
//  AppDelegate.swift
//  BonprixCodeChallenge
//
//  Created by Hannes Kühnel on 17.08.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = tabbarController()
        window?.makeKeyAndVisible()
        
        
        // remove default tabbar translucency on iOS 15 and above
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
        
        return true
    }
    
    private func tabbarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        
        let webViewController = WebViewController()
        webViewController.configureHomePage()
        
        let homeNavigationController = UINavigationController(rootViewController: webViewController)
        homeNavigationController.tabBarItem = UITabBarItem(title: "Shop", image: UIImage(systemName: "house"), tag: 0)
        
        let assortmentNavigationController = UINavigationController(rootViewController: AssortmentViewController())
        
        assortmentNavigationController.tabBarItem = UITabBarItem(title: "Sortiment", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        
        tabBarController.setViewControllers([
            homeNavigationController,
            assortmentNavigationController,
        ], animated: false)
        
        tabBarController.selectedIndex = 0
        tabBarController.tabBar.tintColor = .bonprixRed
        
        return tabBarController
    }
}
