//
//  AppsHeaderHorizontalCell.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-25.
//

import UIKit

class AppsHeaderHorizontalCell: UICollectionViewCell {
    
    private let title: UILabel = {
        let label = UILabel(text: "<_Title_>", font: .boldSystemFont(ofSize: 12))
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel(text: "<_Subtitle_>", font: .boldSystemFont(ofSize: 18))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        image.widthAnchor.constraint(equalTo: image.heightAnchor, multiplier: 16/9).isActive = true
        return image
    }()
    
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
        
        let verticalStackView = UIStackView(arrangedSubviews: [title, subtitle, imageView])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 12
        
        addSubview(verticalStackView)
        verticalStackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 12, left: 12, bottom: 12, right: 12))
    }
    
    private func style() {
        
        layer.cornerRadius = 10
    }
    
    private func setup() {
        
    }
    
    func configure(header: Header) {
        
        title.text = header.name
        subtitle.text = header.tagline
        imageView.sd_setImage(with: URL(string: header.imageUrl))
    }
}
