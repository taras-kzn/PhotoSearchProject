//
//  FavoriteDetailPhotoModuleAssembly.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 07.09.2022.
//

import UIKit

protocol FavoriteDetailPhotoModuleAssemblyProtocol {
    func createDetailFavoritePhotoCollection(viewModel: DetailsPhotoViewModel?, navigationController: UINavigationController?) -> UIViewController
    
}

class FavoriteDetailPhotoModuleAssembly: FavoriteDetailPhotoModuleAssemblyProtocol {
    func createDetailFavoritePhotoCollection(viewModel: DetailsPhotoViewModel?, navigationController: UINavigationController?) -> UIViewController {
        let viewController        = FavoriteDetailPhotoViewController()
        let interactor            = FavoriteDetailPhotoInteractor(viewModel: viewModel)
        let presenter             = FavoriteDetailPhotoPresenter()
        let router                = FavoriteDetailPhotoRouter(navigationController: navigationController)
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
        return viewController
    }
    

}
