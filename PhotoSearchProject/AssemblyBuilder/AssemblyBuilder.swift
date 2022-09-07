//
//  ModuleBuilder.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import UIKit

protocol AssemblyBuilderProtocol {
   // func createPhotosCollection(router: RouterPhotosCollectionProtocol) -> UIViewController
    func createDetailPhotosCollection(id: String?, router: RouterPhotosCollectionProtocol) -> UIViewController
  //  func createFavoritePhotosCollection(router: RouterFavoritePhotosCollectionProtocol) -> UIViewController
   // func createDetailFavoritePhotoCollection(viewModel: DetailsPhotoViewModel?, router: RouterFavoritePhotosCollectionProtocol) -> UIViewController
}

class AssemblyBuilder: AssemblyBuilderProtocol {
//    func createPhotosCollection(router: RouterPhotosCollectionProtocol) -> UIViewController {
//        let viewController = PhotosCollectionViewController()
//        let interactor            = PhotosCollectionInteractor()
//        let presenter             = PhotosCollectionPresenter()
//        let router                = PhotosCollectionRouter(router: router)
//        let networkService        = NetworkService()
//        let networkDataFetcher    = NetworkDataFetcher(networkService: networkService)
//        viewController.interactor = interactor
//        viewController.router     = router
//        interactor.presenter      = presenter
//        interactor.networkDataFetcher = networkDataFetcher
//        presenter.viewController  = viewController
//        router.viewController     = viewController
//        return viewController
//    }

    func createDetailPhotosCollection(id: String?, router: RouterPhotosCollectionProtocol) -> UIViewController {
        let viewController        = DetailPhotoCollectionViewController()
        let interactor            = DetailPhotoCollectionInteractor(idPhoto: id)
        let presenter             = DetailPhotoCollectionPresenter()
        let router                = DetailPhotoCollectionRouter(navigationController: router as! UINavigationController)
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

//    func createFavoritePhotosCollection(router: RouterFavoritePhotosCollectionProtocol) -> UIViewController {
//        let viewController        = FavoritePhotosViewController()
//        let interactor            = FavoritePhotosInteractor()
//        let presenter             = FavoritePhotosPresenter()
//        let router                = FavoritePhotosRouter()
//        viewController.interactor = interactor
//        viewController.router     = router
//        interactor.presenter      = presenter
//        presenter.viewController  = viewController
//        router.viewController     = viewController
//        return viewController
//    }

//    func createDetailFavoritePhotoCollection(viewModel: DetailsPhotoViewModel?, router: RouterFavoritePhotosCollectionProtocol) -> UIViewController {
//        let viewController        = FavoriteDetailPhotoViewController()
//        let interactor            = FavoriteDetailPhotoInteractor(viewModel: viewModel)
//        let presenter             = FavoriteDetailPhotoPresenter()
//        let router                = FavoriteDetailPhotoRouter(router: router)
//        viewController.interactor = interactor
//        viewController.router     = router
//        interactor.presenter      = presenter
//        presenter.viewController  = viewController
//        router.viewController     = viewController
//        return viewController
//    }
}
