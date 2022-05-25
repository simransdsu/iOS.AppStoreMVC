//
//  AppsGroupCell.swift
//  AppStoreMVC
//
//  Created by Simran Preet Singh Narang on 2022-05-23.
//

import Foundation
import UIKit

class AppsGroupCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 28))
    let horizontalController = AppsHorizontalController()
    
    
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
        
    }
    
    private func style() {
        
        backgroundColor = .systemGray6
        
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor,
                          leading: leadingAnchor,
                          bottom: nil,
                          trailing: trailingAnchor)
        titleLabel.backgroundColor = .systemGray5
        
        addSubview(horizontalController.view)
        horizontalController.view.backgroundColor = .systemBlue
        horizontalController.view.anchor(top: titleLabel.bottomAnchor,
                                         leading: leadingAnchor,
                                         bottom: bottomAnchor,
                                         trailing: trailingAnchor)
    }
    
    private func setup() {
        
        
    }
}
