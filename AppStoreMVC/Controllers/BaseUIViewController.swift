//
//  BaseUIViewController.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-01-07.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    init(with title: String? = nil, tabBarImage: UIImage? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.title = title
        self.tabBarItem.image = tabBarImage
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .systemBackground
    }

}
