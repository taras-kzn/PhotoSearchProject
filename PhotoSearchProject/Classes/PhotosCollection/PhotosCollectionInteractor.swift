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
    var networkDataFetcher: DataFetcherPhotosProtocol!

    private let itemsPerRow: CGFloat = 2
    private let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
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
        case .getCalculationCellSize(photoHeight: let photoHeight, photoWidth: let photoWidth, viewWidth: let viewWidth):
            let paddingSpace = sectionInserts.left * (itemsPerRow + 1)
            let availableWidth = viewWidth / itemsPerRow
            let widthPerItem = availableWidth - paddingSpace
            let height = CGFloat(photoHeight) * widthPerItem / CGFloat(photoWidth)
            self.presenter?.presentData(response: .presentCalculationCellSize(width: widthPerItem, height: height, sectionInserts: sectionInserts))
        }
    }
}
