//
//  DetailPhotoCollectionRouter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol DetailPhotosCollectionRouterProtocol {
    var navigationController: UINavigationController? { get set }
}

protocol DetailPhotoCollectionRoutingLogic {
    func popToRootPhotosCollection()
}

class DetailPhotoCollectionRouter: NSObject, DetailPhotosCollectionRouterProtocol {
    weak var viewController: DetailPhotoCollectionViewController?
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}

extension DetailPhotoCollectionRouter: DetailPhotoCollectionRoutingLogic {
    func popToRootPhotosCollection() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
