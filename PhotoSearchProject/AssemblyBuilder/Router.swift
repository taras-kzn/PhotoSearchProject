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

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetailPhotoCollection(idPhoto: String?)
    func popToRoot()
}

class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?

    init(navigationController: UINavigationController ,assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }



    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createPhotosCollection(router: self) else { return print("danger")}
            navigationController.viewControllers = [mainViewController]
        }
    }

    func showDetailPhotoCollection(idPhoto: String?) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailPhotosCollection(id: idPhoto, router: self) else { return }
        navigationController.pushViewController(detailViewController, animated: true)
        }
    }

    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
}


