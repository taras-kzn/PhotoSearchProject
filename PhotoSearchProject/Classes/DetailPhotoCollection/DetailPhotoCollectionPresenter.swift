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
            let location = getLocationCity(city: photo.location?.city, country: photo.location?.country)

            let viewModel = DetailsPhotoViewModel(name: photo.user.name, date: getFormattedDate(dateString: photo.created_at), location: location, download: String(photo.downloads ?? 0), photoUrlString: photo.urls["regular"]!)
            viewController?.displayData(viewModel: .displayDetailsPhoto(detailsPhotoViewModel: viewModel))
        }
    }

    private func getFormattedDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: dateString)
        guard let date = date else {return "no date"}
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let result = dateFormatter.string(from: date)
        return result
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

    private func getLocationCountry(location: String?) -> String {
        if let location = location {
            return "Country: \(location)"
        }
        return " "
    }
}
