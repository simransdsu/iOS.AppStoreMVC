//
//  SearchViewController.swift
//  AppStoreMVC
//
//  Created by Simran Preet Narang on 2022-01-07.
//

import UIKit

class SearchViewController: BaseTabHostViewController {
    
    private let cellId = "\(SearchResultCollectionViewCell.self)"
    private var dataSource = [App]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    // For Throttling search
    private var timer: Timer?
    
    private var searchController = UISearchController(searchResultsController: nil)
    
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
        setupSearchBar()
    }
}

// MARK: - UIViews setup
private extension SearchViewController {
    
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
        collectionView.register(SearchResultCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setupSearchBar() {
        
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.delegate = self
    }
}


// MARK: - CollectionView Data Source
extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataSource.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchResultCollectionViewCell
        let cellItem = dataSource[indexPath.row]
        cell.configure(withData: cellItem)
        return cell
    }
}


// MARK: - CollectionView Delegate Flow Layout
extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        return .init(width: view.frame.width, height: 350)
    }
}


// MARK: - SearchBar Delegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        // Invalidating the previous timer
        timer?.invalidate()
        // Adding a delay of half a second.
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { [weak self] _ in
            self?.fetchITunesApps(withTerm: searchText)
        })
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        fetchITunesApps()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        print("\(#function)")
        fetchITunesApps(withTerm: searchBar.searchTextField.text ?? "")
    }
}


// MARK: - Helper functions
private extension SearchViewController {
    
    func fetchITunesApps(withTerm term: String = "instagram") {
        
        Task {
            do {
                let response = try await ITunesService.shared.searchAPI(withTerm: term)
                self.updateCollectionViewDataSource(withResult: response.results)
            } catch {
                handleError(error: error)
            }
        }
    }
    
    func updateCollectionViewDataSource(withResult results: [App]) {
        
        self.dataSource = results
    }
}
