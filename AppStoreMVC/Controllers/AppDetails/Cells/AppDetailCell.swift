//
//  AppDetailCell.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-27.
//

import Foundation

import UIKit

class AppDetailCell: UICollectionViewCell {
    
    let appIconImageView = UIImageView(cornerRadius: 16)
    let nameLabel = UILabel(text: "<_AppName_>", font: .boldSystemFont(ofSize: 24), numberOfLines: 2)
    let priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Free", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemBlue
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.layer.cornerRadius = 15
        return button
    }()
    let whatsNewLabel = UILabel(text: "What's New", font: .boldSystemFont(ofSize: 20))
    let releaseNotesLabel = UILabel(text: "Release Notes", font: .systemFont(ofSize: 16), numberOfLines: 0)
    
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
        
        NSLayoutConstraint.activate([
            appIconImageView.heightAnchor.constraint(equalToConstant: 100),
            appIconImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        let stackView = VStackView(arrangedSubviews: [
            HStackView(arrangedSubviews: [
                appIconImageView,
                VStackView(arrangedSubviews:[
                    nameLabel,
                    UIStackView(arrangedSubviews: [
                        priceButton,
                        UIView()
                    ])
                ], spacing: 20)
            ], spacing: 12),
            whatsNewLabel,
            releaseNotesLabel
        ], spacing: 16)
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    private func style() {
        
        backgroundColor = .systemGray6
    }
    
    private func setup() {
        
        appIconImageView.backgroundColor = .systemBlue
    }
}
