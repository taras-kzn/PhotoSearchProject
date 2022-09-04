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
    var service: PhotosCollectionService?
    
    func makeRequest(request: PhotosCollection.Model.Request.RequestType) {
        if service == nil {
            service = PhotosCollectionService()
        }
    }
    
}
