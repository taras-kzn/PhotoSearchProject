//
//  FavoritePhotosInteractor.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoritePhotosBusinessLogic {
    func makeRequest(request: FavoritePhotos.Model.Request.RequestType)
}

class FavoritePhotosInteractor: FavoritePhotosBusinessLogic {

    var presenter: FavoritePhotosPresentationLogic?

    func makeRequest(request: FavoritePhotos.Model.Request.RequestType) {

    }
}
