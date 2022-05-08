//
//  SearchResultCollectionViewCell.swift
//  AppStoreMVC
//
//  Created by Simran Preet Singh Narang on 2022-05-08.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "\(SearchResultCollectionViewCell.self)"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemRed
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "APP_NAME"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "CATEGORY"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "RATING"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.backgroundColor = .lightGray
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.layer.cornerRadius = 15
        return button
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        backgroundColor = .systemBackground
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        
        setupHorizontalStackViewForAppIconImageLabelsAndGetButton()
    }
    
    private func style() {
        
    }
}


// MARK: - UIViews setup
private extension SearchResultCollectionViewCell {
    
    func setupHorizontalStackViewForAppIconImageLabelsAndGetButton() {
        
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [imageView, labelsStackView, getButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 12
        stackView.alignment = .top
        
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
