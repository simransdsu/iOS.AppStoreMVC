//
//  PreviewCell.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-30.
//

import Foundation

import UIKit

enum PreviewCellSize {
    static let width: CGFloat = 300
    static var height: CGFloat {
        (Double(width) * 15.0) / 9.0
    }
}

class PreviewCell: UICollectionViewCell {
    
    let horizontalController = PreviewScreenshotsController()
    
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
        
        horizontalController.view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalController.view)
        horizontalController.view.fillSuperview()
    }
    
    private func style() {
        
        backgroundColor = .systemGray6
    }
    
    private func setup() {
        
    }
    
    public func config(model: AppModel) {
        
        horizontalController.configure(urls: model.screenshotUrls)
    }
}


