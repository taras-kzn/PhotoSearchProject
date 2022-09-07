//
//  FavoritePhotosModuleAssembly.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 07.09.2022.
//

import UIKit

protocol FavoritePhotosModuleAssemblyProtocol {
    func createFavoritePhotos(navigationController: UINavigationController?, assemblyBuilder: FavoritePhotosModuleAssemblyProtocol?) -> UIViewController
}

class FavoritePhotosModuleAssembly: FavoritePhotosModuleAssemblyProtocol {
    func createFavoritePhotos(navigationController: UINavigationController?, assemblyBuilder: FavoritePhotosModuleAssemblyProtocol?) -> UIViewController {
        let viewController        = FavoritePhotosViewController()
        let interactor            = FavoritePhotosInteractor()
        let presenter             = FavoritePhotosPresenter()
        let router                = FavoritePhotosRouter(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        return viewController
    }
}
