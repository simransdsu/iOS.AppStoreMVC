//
//  AppsViewController.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-01-07.
//

import UIKit

class AppsViewController: BaseTabHostViewController {

    private let cellId = "\(AppsGroupCell.self)"
    private let headerId = "\(AppsHeaderReusableView.self)"
    private var dataSource = [String: [String]]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
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
    
    private func style() {
        
    }
    
    private func setup() {
        
        setupCollectionView()
        dataSource = [
            "Top Free Apps": ["Facebook", "Twitter", "Instagram", "WhatsApp", "lululemon", "Amazon", "Dropbox", "Notefy"],
            "Top Paid Apps": ["Adobe Premiure", "Final Cut Pro", "Adobe Photoshop", "CameraX", "Netflix", "Spotify"],
            "Top Games": ["Clash Royale", "Pokemon Go", "Paterned", "Mario Kart", "Stumble Guys", "Barberian Merge"],
            "Most downloaded": ["Microsoft Authenticator", "Facebook", "Outlook", "lululemon", "Spotify"],
        ]
    }
}


// MARK: - UIViews setup
private extension AppsViewController {
    
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
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppsHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
}


// MARK: - CollectionView Data Source
extension AppsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.keys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsHeaderReusableView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        return .init(width: view.frame.width - 42, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        cell.configure(groupTitle: Array(dataSource.keys)[indexPath.row],
                       dataSource: dataSource[Array(dataSource.keys)[indexPath.row]] ?? [])
        return cell
    }
}


// MARK: - CollectionView Delegate Flow Layout
extension AppsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return .init(width: view.frame.width, height: 390)
    }
}
