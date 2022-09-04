//
//  PhotosCollectionInteractor.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol PhotosCollectionBusinessLogic {
    func makeRequest(request: PhotosCollection.Model.Request.RequestType)
}

class PhotosCollectionInteractor: PhotosCollectionBusinessLogic {
    
    var presenter: PhotosCollectionPresentationLogic?

    private var networkDataFetcher: DataFetcherProtocol = NetworkDataFetcher(networkService: NetworkService())
    
    func makeRequest(request: PhotosCollection.Model.Request.RequestType) {

        switch request {
        case .getPhotosRandom:
            networkDataFetcher.getImageRandom { [weak self] photos in
                guard let photos = photos, let self = self else { return }
                self.presenter?.presentData(response: .presentPhotosRandom(photos: photos))
            }
        case .getImageBySearch(search: let search):
            networkDataFetcher.getImageBySearch(search: search) { [weak self] results in
                guard let photos = results, let self = self else { return }
                self.presenter?.presentData(response: .presentImageBySearch(photos: photos))
            }
        }
    }
    
}
