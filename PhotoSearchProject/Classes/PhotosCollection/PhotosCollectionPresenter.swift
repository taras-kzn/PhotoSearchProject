//
//  PhotosCollectionPresenter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol PhotosCollectionPresentationLogic {
    func presentData(response: PhotosCollection.Model.Response.ResponseType)
}

class PhotosCollectionPresenter: PhotosCollectionPresentationLogic {
    weak var viewController: PhotosCollectionDisplayLogic?
    
    func presentData(response: PhotosCollection.Model.Response.ResponseType) {
        switch response {
        case .presentPhotosRandom(photos: let photos):
            let photosViewModel = photos.map { photo in
                PhotosViewModel.init(id: photo.id, width: photo.width, height: photo.height, name: photo.user.name, photoUrlRegularSize: photo.urls["regular"]!)
            }
            viewController?.displayData(viewModel: .displayPhotosRandom(photosViewModel: photosViewModel))
        case .presentImageBySearch(photos: let photos):
            let photosViewModel = photos.results.map { photo in
                PhotosViewModel.init(id: photo.id, width: photo.width, height: photo.height, name: photo.user.name, photoUrlRegularSize: photo.urls["regular"]!)
            }
            viewController?.displayData(viewModel: .displayImageBySearch(photosViewModel: photosViewModel))
        case .presentCalculationCellSize(width: let width, height: let height, sectionInserts: let sectionInserts):
            let sizeCellViewModel = SizeCellViewModel(sizeCell: CGSize(width: width, height: height), sectionInserts: sectionInserts, sectionInsertsLeft: sectionInserts.left)
            viewController?.displayData(viewModel: .displayCalculationCellSize(sizeCellViewModel: sizeCellViewModel))
        }
    }
}
