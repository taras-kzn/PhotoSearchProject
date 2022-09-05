//
//  PhotosCollectionRouter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol PhotosCollectionRoutingLogic {
    init(router: RouterProtocol)
    func showDetails(idPhoto: String?)
}

class PhotosCollectionRouter: NSObject, PhotosCollectionRoutingLogic {

    weak var viewController: PhotosCollectionViewController?
    var router: RouterProtocol!

    required init(router: RouterProtocol) {
        self.router = router
    }

    func showDetails(idPhoto: String?){
        router.showDetailPhotoCollection(idPhoto: idPhoto)
    }

    // MARK: Routing


}
