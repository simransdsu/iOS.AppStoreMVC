//
//  AppDetailCell.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-27.
//

import Foundation

import UIKit

class AppDetailCell: UICollectionViewCell {
    
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
    }
    
    private func setup() {
        
    }
}
