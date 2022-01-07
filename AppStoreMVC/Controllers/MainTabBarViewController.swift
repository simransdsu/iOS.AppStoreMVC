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
        
        viewControllers = [
            UINavigationController(rootViewController: TodayViewController.makeTabbedViewController(with: "Today",
                                                                                                    image: UIImage(systemName: "doc.text.image"))),
            UINavigationController(rootViewController: AppsViewController.makeTabbedViewController(with: "Apps",
                                                                                                   image: UIImage(systemName: "square.3.stack.3d.top.filled"))),
            UINavigationController(rootViewController: SearchViewController.makeTabbedViewController(with: "Search",
                                                                                                     image: UIImage(systemName: "magnifyingglass")))
        ]
        
    }

}


extension UIViewController {
    static func makeTabbedViewController(with title: String?, image: UIImage?) -> Self {
        let vc = Self()
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        vc.view.backgroundColor = .systemBackground
        return vc
    }
}
