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
    //MARK: - private properties
    private var collectionView: UICollectionView!
    private var timer: Timer?
    private var photos = [PhotosViewModel]()
    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupSearchBar()
        setupCollectionView()

        //PhotosCollectionConfigure.shared.configure(with: self)

        interactor?.makeRequest(request: .getPhotosRandom)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        interactor?.makeRequest(request: .getPhotosRandom)
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
        collectionView.register(PhotosCell.self, forCellWithReuseIdentifier: PhotosCell.reuseId)
        collectionView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.contentInsetAdjustmentBehavior = .automatic
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
        switch viewModel {
        case .displayPhotosRandom(photosViewModel: let photosViewModel):
            photos = photosViewModel
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        case .displayImageBySearch(photosViewModel: let photosViewModel):
            photos = photosViewModel
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

//MARK: - UICollectionViewDataSource
extension PhotosCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCell.reuseId, for: indexPath) as? PhotosCell else { fatalError("Failed to dequeue cell with ID: (T.defaultReuseIdentifier")}
        let photos = photos[indexPath.item]
        cell.set(viewModel: photos)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        print(photo)
    }
}

//MARK: - UICollectionViewDelegate
extension PhotosCollectionViewController: UICollectionViewDelegate {

}

//MARK: - UISearchBarDelegate
extension PhotosCollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            self.interactor?.makeRequest(request: .getImageBySearch(search: searchText))
        })
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photo = photos[indexPath.item]
        let paddingSpace = sectionInserts.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width / itemsPerRow
        let widthPerItem = availableWidth - paddingSpace
        let height = CGFloat(photo.height) * widthPerItem / CGFloat(photo.width)
        return CGSize(width: widthPerItem, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
