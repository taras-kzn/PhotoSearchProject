//
//  FavoritePhotosRouter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoritePhotosRoutingLogic {
    init(router: RouterPhotosCollectionProtocol)
    func showDetails(idPhoto: String?)
}

class FavoritePhotosRouter: NSObject, FavoritePhotosRoutingLogic {
    weak var viewController: FavoritePhotosViewController?

    var router: RouterPhotosCollectionProtocol!

    required init(router: RouterPhotosCollectionProtocol) {
        self.router = router
    }

    func showDetails(idPhoto: String?) {
        print("")
    }
}
