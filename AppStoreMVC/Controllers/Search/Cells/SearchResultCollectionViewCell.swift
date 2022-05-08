//
//  SearchResultCollectionViewCell.swift
//  AppStoreMVC
//
//  Created by Simran Preet Singh Narang on 2022-05-08.
//

import UIKit

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "\(SearchResultCollectionViewCell.self)"
    
    let appIconImageView: UIImageView = {
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
    
    lazy var screenshotImageView1 = self.createScreenShotImageView()
    lazy var screenshotImageView2 = self.createScreenShotImageView()
    lazy var screenshotImageView3 = self.createScreenShotImageView()
    
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
        
        let infoStackView = UIStackView(arrangedSubviews: [appIconImageView, labelsStackView, getButton])
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.spacing = 12
        infoStackView.alignment = .center
        
        addSubview(infoStackView)
        
        let screenShotsStackView = UIStackView(arrangedSubviews: [screenshotImageView1, screenshotImageView2, screenshotImageView3])
        screenShotsStackView.distribution = .fillEqually
        screenShotsStackView.spacing = 10
        
        let overAllStackView = UIStackView(arrangedSubviews: [infoStackView, screenShotsStackView])
        overAllStackView.axis = .vertical
        overAllStackView.spacing = 12
        
        
        addSubview(overAllStackView)
        overAllStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = [.systemIndigo, .systemPink, .systemBlue, .systemGreen, .systemCyan].randomElement()
        imageView.layer.cornerRadius = 10
        return imageView
    }
}
