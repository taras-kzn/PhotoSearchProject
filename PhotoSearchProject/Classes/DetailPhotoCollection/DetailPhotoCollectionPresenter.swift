//
//  DetailPhotoCollectionPresenter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol DetailPhotoCollectionPresentationLogic {
    func presentData(response: DetailPhotoCollection.Model.Response.ResponseType)
}

class DetailPhotoCollectionPresenter: DetailPhotoCollectionPresentationLogic {
    weak var viewController: DetailPhotoCollectionDisplayLogic?

    func presentData(response: DetailPhotoCollection.Model.Response.ResponseType) {

        switch response {

        case .presentDetailsPhoto(photo: let photo):
            let location = "City: \(String(describing: photo.location?.city ?? "")), Country: \(String(describing: photo.location?.country ?? ""))"

            let viewModel = DetailsPhotoViewModel(name: photo.user.name, date: "23-34-2099", location: location, download: String(photo.downloads ?? 0), photoUrlString: photo.urls["regular"]!)
            viewController?.displayData(viewModel: .displayDetailsPhoto(detailsPhotoViewModel: viewModel))
        }
    }
}
