//
//  FavoriteDetailPhotoRouter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoriteDetailPhotoRouterProtocol {
    var navigationController: UINavigationController? { get set }
}

protocol FavoriteDetailPhotoRoutingLogic {
    func popToRootFavoritePhotos()
}

class FavoriteDetailPhotoRouter: NSObject, FavoriteDetailPhotoRouterProtocol {
    weak var viewController: FavoriteDetailPhotoViewController?
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

extension FavoriteDetailPhotoRouter: FavoriteDetailPhotoRoutingLogic {
    func popToRootFavoritePhotos() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
