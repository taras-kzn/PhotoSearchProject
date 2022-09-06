//
//  FavoritePhotosPresenter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoritePhotosPresentationLogic {
    func presentData(response: FavoritePhotos.Model.Response.ResponseType)
}

class FavoritePhotosPresenter: FavoritePhotosPresentationLogic {
    weak var viewController: FavoritePhotosDisplayLogic?

    func presentData(response: FavoritePhotos.Model.Response.ResponseType) {

    }
}
