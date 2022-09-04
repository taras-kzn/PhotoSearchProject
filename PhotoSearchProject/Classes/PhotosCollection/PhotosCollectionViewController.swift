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

    var collectionView: UICollectionView!

    //MARK: - Setup
    private func setup() {
        let viewController        = self
        let interactor            = PhotosCollectionInteractor()
        let presenter             = PhotosCollectionPresenter()
        let router                = PhotosCollectionRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }

    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupCollectionView()

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
