//
//  ViewController.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-01-07.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllersWithNavigation()
    }
    
    private func setupViewControllersWithNavigation() {
        
        viewControllers = [
            UINavigationController(
                rootViewController: AppsViewController(with: "Apps", tabBarImage: UIImage(systemName: "square.3.stack.3d.top.filled"))
            ),
            
            UINavigationController(
                rootViewController: SearchViewController(with: "Search", tabBarImage: UIImage(systemName: "magnifyingglass"))
            ),
            
            UINavigationController(
                rootViewController: TodayViewController(with: "Today", tabBarImage: UIImage(systemName: "doc.text.image"))
            ),
        ]
    }
    
}
