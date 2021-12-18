//
//  AppDelegate.swift
//  HomeWork13
//
//  Created by Ольга on 15.12.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let firstViewController = MedialibraryViewController()
        let firstNavigationController = UINavigationController(rootViewController: firstViewController)
        firstViewController.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0)
        
        let secondViewController = ForYouViewController()
        let secondNavigationController = UINavigationController(rootViewController: secondViewController)
        secondViewController.tabBarItem = UITabBarItem(title: "Для Вас", image: UIImage(systemName: "heart.text.square.fill"), tag: 1)
        
        let thirdViewController = AlbumsViewController()
        let thirdNavigationController = UINavigationController(rootViewController: thirdViewController)
        thirdViewController.tabBarItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        
        let fourthViewController = SearchViewController()
        let fourthNavigationController = UINavigationController(rootViewController: fourthViewController)
        fourthViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        
        let tabBarController = UITabBarController()
        
        tabBarController.setViewControllers([
            firstNavigationController,
            secondNavigationController,
            thirdNavigationController,
            fourthNavigationController
        ], animated: true)
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

