//
//  AppsHeaderHorizontalController.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-25.
//

import UIKit

class AppsHeaderHorizontalContainer: UIViewController {
    
    // TODO: Replace with your cell
    private let cellId = "\(AppsHeaderHorizontalCell.self)"
    // TODO: Replace with your data source model
    private var dataSource = [Header]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    private var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
        setup()
        
    }
    
    private func layout() {
        
        layoutCollectionView()
    }
    
    private func style() {
        
    }
    
    private func setup() {
        
        setupCollectionView()
    }
    
    func configure(headers: [Header]) {
        dataSource = headers
    }
}


// MARK: - UIViews setup
private extension AppsHeaderHorizontalContainer {
    
    func layoutCollectionView() {
        
        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func setupCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        // TODO: Replace with your cell
        collectionView.register(AppsHeaderHorizontalCell.self.self, forCellWithReuseIdentifier: cellId)
    }
}


// MARK: - CollectionView Data Source
extension AppsHeaderHorizontalContainer: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: Replace with your cell dequing logic
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsHeaderHorizontalCell
        cell.configure(header: dataSource[indexPath.row])
        return cell
    }
}


// MARK: - CollectionView Delegate Flow Layout
extension AppsHeaderHorizontalContainer: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return .init(width: view.frame.width - 42, height: 275)
    }
}
