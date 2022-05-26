//
//  AppsHeaderReusableView.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-25.
//

import UIKit

class AppsHeaderReusableView: UICollectionReusableView {
    
    let appheaderHorizontalController = AppsHeaderHorizontalContainer()
    private var headers: [HeaderModel]? {
        didSet {
            if let headers = headers {
                appheaderHorizontalController.configure(headers: headers)
            }
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        style()
        layout()
        setup()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        
        addSubview(appheaderHorizontalController.view)
        appheaderHorizontalController.view.fillSuperview()
    }
    
    private func style() {
        
        
    }
    
    private func setup() {
        
        
    }
    
    func configure(headers: [HeaderModel]) {
        self.headers = headers
    }
}
