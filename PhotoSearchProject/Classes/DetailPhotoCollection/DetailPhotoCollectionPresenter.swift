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
    private var viewModel = DetailsPhotoViewModel(name: "", date: "", location: "", download: "", created_at: "", photoUrlString: "")

    func presentData(response: DetailPhotoCollection.Model.Response.ResponseType) {

        switch response {

        case .presentDetailsPhoto(photo: let photo):
            let location = getLocationCity(city: photo.location?.city, country: photo.location?.country)
            viewModel = DetailsPhotoViewModel(name: photo.user.name, date: WorkerDateFormatter.shared.getFormattedDate(dateString: photo.created_at), location: location, download: String(photo.downloads ?? 0), created_at: photo.created_at, photoUrlString: photo.urls["regular"]!)
            viewController?.displayData(viewModel: .displayDetailsPhoto(detailsPhotoViewModel: viewModel))
        case .presentAddedPhoto(favoritePhotos: let favoritePhotos):
            var favoriteVCPhoto = favoritePhotos
            if favoriteVCPhoto.count == 0 {
                favoriteVCPhoto.append(self.viewModel)
            } else {
                var isAppendPhoto = true
                for photo in favoriteVCPhoto {
                    if photo.photoUrlString.lowercased() == self.viewModel.photoUrlString.lowercased() {
                        isAppendPhoto = false
                    }
                }
                if isAppendPhoto {
                    favoriteVCPhoto.append(self.viewModel)
                }
            }
            viewController?.displayData(viewModel: .displayAddedPhoto(detailsPhotoViewModel: favoriteVCPhoto))
        }
    }

    private func getLocationCity(city: String?, country: String?) -> String {
        if let city = city, let country = country {
            return "City: \(city), Country: \(country)"
        } else if let country = country {
            return "Country: \(country)"
        } else if let city = city {
            return "City: \(city)"
        } else {
            return "no location"
        }
    }
}
