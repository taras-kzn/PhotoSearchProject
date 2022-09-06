//
//  Router.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterPhotosCollectionProtocol {
    func initialPhotosCollectionViewController()
    func showDetailPhoto(idPhoto: String?)
    func popToRootPhotosCollection()
}

protocol RouterFavoritePhotosCollectionProtocol {
    func initialFavoritePhotosViewController()
    func showDetailFavoritePhoto(viewModel: DetailsPhotoViewModel?)
    func popToRootFavoritePhotos()
}

class Router: RouterMain {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?

    init(navigationController: UINavigationController ,assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
}

//MARK: - RouterPhotosCollectionProtocol
extension Router: RouterPhotosCollectionProtocol {
    func initialPhotosCollectionViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createPhotosCollection(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }

    func showDetailPhoto(idPhoto: String?) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailPhotosCollection(id: idPhoto, router: self) else { return }
        navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    func popToRootPhotosCollection() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}

extension Router: RouterFavoritePhotosCollectionProtocol {
    func initialFavoritePhotosViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createFavoritePhotosCollection(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }

    func showDetailFavoritePhoto(viewModel: DetailsPhotoViewModel?) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailFavoritePhotoCollection(viewModel: viewModel, router: self) else { return }
        navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    func popToRootFavoritePhotos() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}


