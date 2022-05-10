//
//  SearchResultCollectionViewCell.swift
//  AppStoreMVC
//
//  Created by Simran Preet Singh Narang on 2022-05-08.
//

import UIKit
import SDWebImage

class SearchResultCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "\(SearchResultCollectionViewCell.self)"
    
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .systemRed
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
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
        button.backgroundColor = .systemGray5
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
    
    func configure(withData data: APIResult) {
        nameLabel.text = data.trackName
        categoryLabel.text = data.primaryGenreName
        ratingsLabel.text = data.formattedPrice
        appIconImageView.sd_setImage(with: URL(string: data.artworkUrl512))
        
        if data.screenshotUrls.count >= 1 {
            screenshotImageView1.sd_setImage(with: URL(string: data.screenshotUrls[0]))
        }
        
        if data.screenshotUrls.count >= 2 {
            screenshotImageView2.sd_setImage(with: URL(string: data.screenshotUrls[1]))
        }
        
        if data.screenshotUrls.count >= 3 {
            screenshotImageView3.sd_setImage(with: URL(string: data.screenshotUrls[2]))
        }
    }
}


// MARK: - UIViews setup
private extension SearchResultCollectionViewCell {
    
    func setupHorizontalStackViewForAppIconImageLabelsAndGetButton() {
        
        // StackView for title, category and price
        let labelsStackView = VerticalStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // StackView for the AppIcon, labels, and get button
        let infoStackView = UIStackView(arrangedSubviews: [appIconImageView, labelsStackView, getButton])
        infoStackView.translatesAutoresizingMaskIntoConstraints = false
        infoStackView.spacing = 12
        infoStackView.alignment = .center
        
        addSubview(infoStackView)
        
        // Upto 3 Screenshots in a Stack View
        let screenShotsStackView = UIStackView(arrangedSubviews: [screenshotImageView1, screenshotImageView2, screenshotImageView3])
        screenShotsStackView.distribution = .fillEqually
        screenShotsStackView.spacing = 10
        
        // StackView that containts the top view and the screenshots
        let overAllStackView = VerticalStackView(arrangedSubviews: [infoStackView, screenShotsStackView])
        overAllStackView.spacing = 12
        
        addSubview(overAllStackView)
        overAllStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }
}
