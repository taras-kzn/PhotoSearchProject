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
    private var sizeCellViewModel = SizeCellViewModel()

    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.color = .gray
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setupSearchBar()
        setupCollectionView()
        getPhotoRandom()
        setupSpinner()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

      //  getPhotoRandom()
        //Test
    }

    deinit {
        print("PhotosCollectionViewController - no retain cycle")
    }



    //wefwefwefwefwef

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

    private func setupSpinner() {
        view.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: collectionView.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: collectionView.centerYAnchor).isActive = true
    }

    //MARK: - methods
    private func getPhotoRandom() {
        spinner.startAnimating()
        interactor?.makeRequest(request: .getPhotosRandom)
    }
}

//MARK: - PhotosCollectionDisplayLogic
extension PhotosCollectionViewController: PhotosCollectionDisplayLogic {

    func displayData(viewModel: PhotosCollection.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayPhotosRandom(photosViewModel: let photosViewModel):
            spinner.stopAnimating()
            photos = photosViewModel
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        case .displayImageBySearch(photosViewModel: let photosViewModel):
            self.spinner.stopAnimating()
            photos = photosViewModel
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        case .displayCalculationCellSize(sizeCellViewModel: let sizeCellViewModel):
            self.sizeCellViewModel = sizeCellViewModel
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
        router?.showDetailPhoto(idPhoto: photo.id)
    }
}

//MARK: - UICollectionViewDelegate
extension PhotosCollectionViewController: UICollectionViewDelegate {

}

//MARK: - UISearchBarDelegate
extension PhotosCollectionViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.spinner.startAnimating()
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
            if searchText == "" {
                self.getPhotoRandom()
            }
            self.interactor?.makeRequest(request: .getImageBySearch(search: searchText))
        })
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let photo = photos[indexPath.item]
        interactor?.makeRequest(request: .getCalculationCellSize(photoHeight: photo.height, photoWidth: photo.width, viewWidth: view.frame.width))

        return sizeCellViewModel.sizeCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sizeCellViewModel.sectionInserts
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sizeCellViewModel.sectionInsertsLeft
    }
}
