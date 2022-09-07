//
//  FavoritePhotosRouter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoritePhotosRouterProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: FavoritePhotosModuleAssemblyProtocol? { get set }
}

protocol FavoritePhotosRoutingLogic {
    func initialFavoritePhotosViewController()
    func showDetailFavoritePhoto(viewModel: DetailsPhotoViewModel?)
    func popToRootFavoritePhotos()
}

class FavoritePhotosRouter: NSObject, FavoritePhotosRouterProtocol {
    weak var viewController: FavoritePhotosViewController?
    var navigationController: UINavigationController?
    var assemblyBuilder: FavoritePhotosModuleAssemblyProtocol?
    private let favoriteDetailPhotoModuleAssembly = FavoriteDetailPhotoModuleAssembly()

    init(navigationController: UINavigationController?, assemblyBuilder: FavoritePhotosModuleAssemblyProtocol?) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
}

extension FavoritePhotosRouter: FavoritePhotosRoutingLogic {
    func initialFavoritePhotosViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createFavoritePhotos(navigationController: navigationController, assemblyBuilder: assemblyBuilder) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }

    func showDetailFavoritePhoto(viewModel: DetailsPhotoViewModel?) {
        if let navigationController = navigationController {
            let detailViewController = favoriteDetailPhotoModuleAssembly.createDetailFavoritePhotoCollection(viewModel: viewModel, navigationController: navigationController)
            navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    func popToRootFavoritePhotos() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
