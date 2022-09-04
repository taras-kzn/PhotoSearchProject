//
//  PhotosCollectionViewController.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol PhotosCollectionDisplayLogic: AnyObject {
    func displayData(viewModel: PhotosCollection.Model.ViewModel.ViewModelData)
}

class PhotosCollectionViewController: UIViewController {
    //MARK: - Properties
    var interactor: PhotosCollectionBusinessLogic?
    var router: (NSObjectProtocol & PhotosCollectionRoutingLogic)?

    private var collectionView: UICollectionView!
    private var timer: Timer?

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupSearchBar()
        setupCollectionView()
        PhotosCollectionConfigure.shared.configure(with: self)
    }

    //MARK: - Setup
    private func setup() {
        navigationItem.title = "Photos"
    }

    //MARK: - setup CollectionView
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CellId")
    }

    //MARK: - setup SearchBar
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
    }
}

//MARK: - PhotosCollectionDisplayLogic
extension PhotosCollectionViewController: PhotosCollectionDisplayLogic {

    func displayData(viewModel: PhotosCollection.Model.ViewModel.ViewModelData) {

    }
}

//MARK: - UICollectionViewDataSource
extension PhotosCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath)
        cell.backgroundColor = .gray
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension PhotosCollectionViewController: UICollectionViewDelegate {

}

//MARK: - UISearchBarDelegate
extension PhotosCollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            print(searchText)
        })
    }
}
