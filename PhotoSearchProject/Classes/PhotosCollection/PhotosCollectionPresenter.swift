//
//  PhotosCollectionPresenter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PhotosCollectionPresentationLogic {
  func presentData(response: PhotosCollection.Model.Response.ResponseType)
}

class PhotosCollectionPresenter: PhotosCollectionPresentationLogic {
  weak var viewController: PhotosCollectionDisplayLogic?

  func presentData(response: PhotosCollection.Model.Response.ResponseType) {

  }

}
