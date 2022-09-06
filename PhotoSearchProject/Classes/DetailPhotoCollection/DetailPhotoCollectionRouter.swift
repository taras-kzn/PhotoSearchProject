//
//  DetailPhotoCollectionRouter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol DetailPhotoCollectionRoutingLogic {
    init(router: RouterPhotosCollectionProtocol)
    func popToRootPhotosCollection()
}

class DetailPhotoCollectionRouter: NSObject, DetailPhotoCollectionRoutingLogic {

    weak var viewController: DetailPhotoCollectionViewController?
    var router: RouterPhotosCollectionProtocol!

    required init(router: RouterPhotosCollectionProtocol) {
        self.router = router
    }

    func popToRootPhotosCollection() {
        router.popToRootPhotosCollection()
    }
}
