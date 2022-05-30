//
//  PreviewScreenShotCell.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-30.
//

import UIKit

class PreviewScreenShotCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(urlString: String){
        
        imageView.sd_setImage(with: URL(string: urlString))
    }
}
