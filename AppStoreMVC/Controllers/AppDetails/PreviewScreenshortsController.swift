//
//  PreviewScreenshortsController.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-30.
//

import UIKit

class PreviewScreenshotsController: UIViewController {
    
    // TODO: Replace with your cell
    private let cellId = "\(PreviewScreenShotCell.self)"
    // TODO: Replace with your data source model
    private var dataSource = [String]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = HorizontalSnappingController(withWidth: PreviewCellSize.width, widthOffSet: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.decelerationRate = .fast
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
    
    private func style() { }
    
    private func setup() {
        
        setupCollectionView()
    }
    
    func configure(urls: [String]) {
        dataSource = urls
    }
}


// MARK: - UIViews setup
private extension PreviewScreenshotsController {
    
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
        collectionView.register(PreviewScreenShotCell.self, forCellWithReuseIdentifier: cellId)
    }
}


// MARK: - CollectionView Data Source
extension PreviewScreenshotsController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: Replace with your cell dequing logic
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PreviewScreenShotCell
        cell.configure(urlString: dataSource[indexPath.row])
        return cell
    }
}


// MARK: - CollectionView Delegate Flow Layout
extension PreviewScreenshotsController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return .init(width: PreviewCellSize.width, height: PreviewCellSize.height)
    }
}
