//
//  AppDetailsViewController.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-26.
//

import UIKit

class AppDetailsViewController: UIViewController {
    
    private var appModel: AppModel? = nil {
        didSet {
            title = appModel?.trackName
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setup()
    }
    
    private func layout() { }
    
    private func style() {
        backgroundColor = .systemBackground
    }
    
    private func setup() { }
}


// MARK: Navigation
extension AppDetailsViewController {
    
    func route(from viewController: UIViewController, withData data: AppModel, navigationStyle: NavigationStyle = .push) {
        
        self.appModel = data
        super.route(from: viewController, navigationStyle: navigationStyle)
    }
}
