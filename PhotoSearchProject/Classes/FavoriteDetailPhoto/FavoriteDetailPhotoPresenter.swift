//
//  FavoriteDetailPhotoPresenter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

protocol FavoriteDetailPhotoPresentationLogic {
    func presentData(response: FavoriteDetailPhoto.Model.Response.ResponseType)
}

class FavoriteDetailPhotoPresenter: FavoriteDetailPhotoPresentationLogic {
    weak var viewController: FavoriteDetailPhotoDisplayLogic?
    
    func presentData(response: FavoriteDetailPhoto.Model.Response.ResponseType) {
        switch response {
        case .presentDetailsPhoto(photo: let photo):
            let viewModel = DetailsPhotoViewModel(name: photo.name, date: WorkerDateFormatter.shared.getFormattedDate(dateString: photo.created_at), location: photo.location, download: photo.download, created_at: photo.created_at, photoUrlString: photo.photoUrlString)
            viewController?.displayData(viewModel: .displayDetailsPhoto(detailsPhotoViewModel: viewModel))
        }
    }
}

