//
//  SearchResultCollectionViewCell.swift
//  AppStoreMVC
//
//  Created by Simran Preet Singh Narang on 2022-05-08.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "\(SearchResultCollectionViewCell.self)"
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}
