//
//  AppRowCell.swift
//  AppStoreMVC
//
//  Created by Simran Preet Singh Narang on 2022-05-24.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemGray5
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.widthAnchor.constraint(equalToConstant: 72).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 72).isActive = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel(text: "App Name", font: .boldSystemFont(ofSize: 17))
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel(text: "Company Name", font: .systemFont(ofSize: 14))
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .systemGray5
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .systemGray3
        return view
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
    
    func configure(with app: AppModel) {
        
        appIconImageView.sd_setImage(with: URL(string: app.artworkUrl512))
        nameLabel.text = app.trackName
        categoryLabel.text = app.primaryGenreName
    }
    
    private func layout() {
        setupHorizontalStackViewForAppIconImageLabelsAndGetButton()
    }
    
    private func style() {
        
        backgroundColor = .systemGray6.withAlphaComponent(0.6)
        layer.cornerRadius = 10
    }
    
    private func setup() {
        
        
    }
    
    private func setupHorizontalStackViewForAppIconImageLabelsAndGetButton() {
        
        // StackView for title, category and price
        let labelsStackView = VStackView(arrangedSubviews: [nameLabel, categoryLabel])
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView for the AppIcon, labels, and get button
        let infoStackView = UIStackView(arrangedSubviews: [appIconImageView, labelsStackView, getButton])
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.spacing = 12
        infoStackView.alignment = .center
        
        addSubview(infoStackView)
        
        // StackView that containts the top view and the screenshots
        let overAllStackView = VStackView(arrangedSubviews: [infoStackView])
        
        addSubview(overAllStackView)
        overAllStackView.fillSuperview(padding: .init(top: 0, left: 16, bottom: 0, right: 16))
    }
}
