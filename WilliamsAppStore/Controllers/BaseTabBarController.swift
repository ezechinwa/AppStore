//
//  BaseTabBarController.swift
//  WilliamsAppStore
//
//  Created by Chinwa Williams on 02/03/2019.
//  Copyright © 2019 Chinwa Williams. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let searchNavigationController: UINavigationController = setUpSearchViewController(title: "Search", image: "search", navigationTitle: "Search")
        let todayNavigationController: UINavigationController = setUpControllers(title: "Today", image: "today_icon", navigationTitle: "Today's")
        let appNavigationController:UINavigationController = setUpControllers(title: "App", image: "apps", navigationTitle: "App")
        
        
        viewControllers = [searchNavigationController,todayNavigationController,appNavigationController]
    }
    
    
    fileprivate func setUpSearchViewController(title:String, image: String, navigationTitle: String) -> UINavigationController {
        let redViewController = AppSearchCollectionViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = navigationTitle
        
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.image = UIImage(named: image)
        redNavController.tabBarItem?.title = title
        redNavController.navigationBar.prefersLargeTitles = true
        redNavController.view.backgroundColor = .white
        return redNavController
    }
    
    
   fileprivate func setUpControllers(title:String, image: String, navigationTitle: String) -> UINavigationController {
        let redViewController = UIViewController()
        redViewController.view.backgroundColor = .white
        redViewController.navigationItem.title = navigationTitle
        
        
        let redNavController = UINavigationController(rootViewController: redViewController)
        redNavController.tabBarItem.image = UIImage(named: image)
        redNavController.tabBarItem?.title = title
        redNavController.navigationBar.prefersLargeTitles = true
        return redNavController
    }
}
