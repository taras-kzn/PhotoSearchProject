//
//  PhotosCollectionModuleAssembly.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 07.09.2022.
//

import UIKit

protocol PhotoCollectionModuleAssemblyProtocol {
    func createPhotosCollection(navigationController: UINavigationController?, assemblyBuilder: PhotoCollectionModuleAssemblyProtocol?) -> UIViewController
}

class PhotosCollectionModuleAssembly: PhotoCollectionModuleAssemblyProtocol {
    func createPhotosCollection(navigationController: UINavigationController?, assemblyBuilder: PhotoCollectionModuleAssemblyProtocol?) -> UIViewController {
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
