//
//  ModuleBuilder.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
    func createPhotosCollection(router: RouterPhotosCollectionProtocol) -> UIViewController
    func createDetailPhotosCollection(id: String?, router: RouterPhotosCollectionProtocol) -> UIViewController
    func createFavoritePhotosCollection(router: RouterPhotosCollectionProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
    func createPhotosCollection(router: RouterPhotosCollectionProtocol) -> UIViewController {
        let viewController = PhotosCollectionViewController()
        let interactor            = PhotosCollectionInteractor()
        let presenter             = PhotosCollectionPresenter()
        let router                = PhotosCollectionRouter(router: router)
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

    func createDetailPhotosCollection(id: String?, router: RouterPhotosCollectionProtocol) -> UIViewController {
        let viewController        = DetailPhotoCollectionViewController()
        let interactor            = DetailPhotoCollectionInteractor(idPhoto: id)
        let presenter             = DetailPhotoCollectionPresenter()
        let router                = DetailPhotoCollectionRouter()
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

    func createFavoritePhotosCollection(router: RouterPhotosCollectionProtocol) -> UIViewController {
        let viewController        = FavoritePhotosViewController()
        let interactor            = FavoritePhotosInteractor()
        let presenter             = FavoritePhotosPresenter()
        let router                = FavoritePhotosRouter(router: router)
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        return viewController
    }
}
