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
            print("")
           // let detailsPhotoViewModel =
        }
    }
}
