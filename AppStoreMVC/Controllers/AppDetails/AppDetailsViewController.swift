//
//  AppDetailsViewController.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-05-26.
//

import UIKit

import UIKit

class AppDetailsViewController: UIViewController {
    
    private let cellId = "\(AppDetailCell.self)"
    
    private var appModel: AppModel? = nil {
        didSet {
            title = appModel?.trackName
        }
    }
    
    private var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
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
}


// MARK: - UIViews setup
private extension AppDetailsViewController {
    
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
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: cellId)
    }
}


// MARK: - CollectionView Data Source
extension AppDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppDetailCell
        if let model = appModel {
            cell.config(model: model)
        }
        return cell
    }
}


// MARK: - CollectionView Delegate Flow Layout
extension AppDetailsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
        if let model = appModel {
            dummyCell.config(model: model)
            dummyCell.layoutIfNeeded()
        }
        let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
        return .init(width: estimatedSize.width, height: estimatedSize.height)
    }
}


// MARK: Navigation
extension AppDetailsViewController {
    
    func route(from viewController: UIViewController, withData data: AppModel, navigationStyle: NavigationStyle = .push()) {
        
        self.appModel = data
        super.route(from: viewController, navigationStyle: navigationStyle)
    }
}
