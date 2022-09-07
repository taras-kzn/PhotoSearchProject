//
//  DetailPhotoCollectionModuleAssembly.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 07.09.2022.
//

import UIKit

protocol DetailPhotoCollectionModuleAssemblyProtocol {
    func createDetailPhotosCollection(id: String?, navigationController: UINavigationController?) -> UIViewController
    
}

class DetailPhotoCollectionModuleAssembly:  DetailPhotoCollectionModuleAssemblyProtocol {
    func createDetailPhotosCollection(id: String?, navigationController: UINavigationController?) -> UIViewController {
        let viewController        = DetailPhotoCollectionViewController()
        let interactor            = DetailPhotoCollectionInteractor(idPhoto: id)
        let presenter             = DetailPhotoCollectionPresenter()
        let router                = DetailPhotoCollectionRouter(navigationController: navigationController)
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
