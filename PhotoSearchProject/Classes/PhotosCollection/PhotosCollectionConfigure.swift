//
//  PhotosCollectionConfigure.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import Foundation

class PhotosCollectionConfigure {
    static let shared = PhotosCollectionConfigure()

    private init() {}

    func configure(with viewController: PhotosCollectionViewController) {
        let interactor            = PhotosCollectionInteractor()
        let presenter             = PhotosCollectionPresenter()
        let router                = PhotosCollectionRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }
}
