//
//  PhotosCollectionRouter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol PhotosCollectionRouterProtocol {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: PhotoCollectionModuleAssembly? { get set }
}

protocol PhotosCollectionRoutingLogic {
    func initialPhotosCollectionViewController()
    func showDetailPhoto(idPhoto: String?)
    func popToRootPhotosCollection()
}

class PhotosCollectionRouter: NSObject, PhotosCollectionRouterProtocol {
    weak var viewController: PhotosCollectionViewController?
    var navigationController: UINavigationController?
    var assemblyBuilder: PhotoCollectionModuleAssembly?

    init(navigationController: UINavigationController?, assemblyBuilder: PhotoCollectionModuleAssembly?) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
}

//MARK: - PhotosCollectionRoutingLogic
extension PhotosCollectionRouter: PhotosCollectionRoutingLogic {

    func initialPhotosCollectionViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createPhotosCollection(navigationController: navigationController, assemblyBuilder: assemblyBuilder) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }

    func showDetailPhoto(idPhoto: String?) {
        if let navigationController = navigationController {
//            guard let detailViewController = assemblyBuilder?.createDetailPhotosCollection(id: idPhoto, router: self) else { return }
//        navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    func popToRootPhotosCollection() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}
