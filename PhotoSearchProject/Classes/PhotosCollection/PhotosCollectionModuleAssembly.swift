//
//  PhotosCollectionModuleAssembly.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 07.09.2022.
//

import UIKit

protocol PhotoCollectionModuleAssembly {
    func createPhotosCollection(navigationController: UINavigationController?, assemblyBuilder: PhotoCollectionModuleAssembly?) -> UIViewController
}

class PhotosCollectionModuleAssembly: PhotoCollectionModuleAssembly {
    func createPhotosCollection(navigationController: UINavigationController?, assemblyBuilder: PhotoCollectionModuleAssembly?) -> UIViewController {
        let viewController = PhotosCollectionViewController()
        let interactor            = PhotosCollectionInteractor()
        let presenter             = PhotosCollectionPresenter()
        let router                = PhotosCollectionRouter(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        let networkService        = NetworkService()
        let networkDataFetcher    = NetworkDataFetcher(networkService: networkService)
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        interactor.networkDataFetcher = networkDataFetcher
        presenter.viewController  = viewController
        router.viewController     = viewController
        return viewController
    }
}
