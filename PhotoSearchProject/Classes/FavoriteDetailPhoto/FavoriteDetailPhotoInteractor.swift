//
//  FavoriteDetailPhotoInteractor.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoriteDetailPhotoBusinessLogic {
    func makeRequest(request: FavoriteDetailPhoto.Model.Request.RequestType)
    init(viewModel: DetailsPhotoViewModel?)
}

class FavoriteDetailPhotoInteractor: FavoriteDetailPhotoBusinessLogic {
    var presenter: FavoriteDetailPhotoPresentationLogic?

    var viewModel: DetailsPhotoViewModel?

    required init(viewModel: DetailsPhotoViewModel?) {
        self.viewModel = viewModel
    }


    func makeRequest(request: FavoriteDetailPhoto.Model.Request.RequestType) {
        switch request {
        case .getDetailsPhoto:
            guard let photo = viewModel else { return }
            presenter?.presentData(response: .presentDetailsPhoto(photo: photo))
        }
    }
}
