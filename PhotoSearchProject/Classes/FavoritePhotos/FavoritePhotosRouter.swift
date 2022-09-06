//
//  FavoritePhotosRouter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoritePhotosRoutingLogic {
    init(router: RouterFavoritePhotosCollectionProtocol)
    func showDetails(viewModel: DetailsPhotoViewModel?)
    
}

class FavoritePhotosRouter: NSObject, FavoritePhotosRoutingLogic {
    weak var viewController: FavoritePhotosViewController?

    var router: RouterFavoritePhotosCollectionProtocol!

    required init(router: RouterFavoritePhotosCollectionProtocol) {
        self.router = router
    }

    func showDetails(viewModel: DetailsPhotoViewModel?) {
        router.showDetailFavoritePhoto(viewModel: viewModel)
    }
}
