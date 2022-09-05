//
//  DetailPhotoCollectionInteractor.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol DetailPhotoCollectionBusinessLogic {
    func makeRequest(request: DetailPhotoCollection.Model.Request.RequestType)
    init(idPhoto: String?)
}

class DetailPhotoCollectionInteractor: DetailPhotoCollectionBusinessLogic {
    var presenter: DetailPhotoCollectionPresentationLogic?
    var service: DetailPhotoCollectionService?
    var networkDataFetcher: DataFetcherDetailPhotoProtocol!
    var idPhoto: String?

    required init(idPhoto: String?) {
        self.idPhoto = idPhoto
    }

    func makeRequest(request: DetailPhotoCollection.Model.Request.RequestType) {
        if service == nil {
            service = DetailPhotoCollectionService()
        }

        switch request {

        case .getDetailsPhoto:
            guard let id = idPhoto else { return }
            networkDataFetcher.getDetailImage(idPhoto: id) { [weak self]  photo in
                guard let photo = photo, let self = self else { return }
                self.presenter?.presentData(response: .presentDetailsPhoto(photo: photo))
            }
        }
    }
}
