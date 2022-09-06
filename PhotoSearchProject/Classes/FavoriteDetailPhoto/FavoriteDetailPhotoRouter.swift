//
//  FavoriteDetailPhotoRouter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoriteDetailPhotoRoutingLogic {
    init(router: RouterFavoritePhotosCollectionProtocol)
    func popToRootFavoritePhotos()

}

class FavoriteDetailPhotoRouter: NSObject, FavoriteDetailPhotoRoutingLogic {
    weak var viewController: FavoriteDetailPhotoViewController?
    var router: RouterFavoritePhotosCollectionProtocol!

    required init(router: RouterFavoritePhotosCollectionProtocol) {
        self.router = router
    }

    func popToRootFavoritePhotos() {
        router.popToRootFavoritePhotos()
    }
}
