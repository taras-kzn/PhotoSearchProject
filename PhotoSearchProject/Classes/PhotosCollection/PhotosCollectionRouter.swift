//
//  PhotosCollectionRouter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol PhotosCollectionRoutingLogic {
    init(router: RouterPhotosCollectionProtocol)
    func showDetails(idPhoto: String?)
}

class PhotosCollectionRouter: NSObject, PhotosCollectionRoutingLogic {

    weak var viewController: PhotosCollectionViewController?
    var router: RouterPhotosCollectionProtocol!

    required init(router: RouterPhotosCollectionProtocol) {
        self.router = router
    }

    func showDetails(idPhoto: String?){
        router.showDetailPhoto(idPhoto: idPhoto)
    }
}
