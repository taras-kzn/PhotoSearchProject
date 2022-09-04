//
//  ModuleBuilder.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import UIKit

protocol Builder {
    static func creatingPhotosCollection() -> UIViewController
}

class ModuleBuilder: Builder {
    static func creatingPhotosCollection() -> UIViewController {
        let viewController = PhotosCollectionViewController()
        let interactor            = PhotosCollectionInteractor()
        let presenter             = PhotosCollectionPresenter()
        let router                = PhotosCollectionRouter()
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
}
