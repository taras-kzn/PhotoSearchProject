//
//  DetailPhotoCollectionInteractor.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

protocol DetailPhotoCollectionBusinessLogic {
    func makeRequest(request: DetailPhotoCollection.Model.Request.RequestType)
}

class DetailPhotoCollectionInteractor: DetailPhotoCollectionBusinessLogic {

    var presenter: DetailPhotoCollectionPresentationLogic?
    var service: DetailPhotoCollectionService?

    func makeRequest(request: DetailPhotoCollection.Model.Request.RequestType) {
        if service == nil {
            service = DetailPhotoCollectionService()
        }
    }

}
