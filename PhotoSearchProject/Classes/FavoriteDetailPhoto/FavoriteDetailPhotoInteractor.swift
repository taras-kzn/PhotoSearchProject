//
//  FavoriteDetailPhotoInteractor.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteDetailPhotoBusinessLogic {
  func makeRequest(request: FavoriteDetailPhoto.Model.Request.RequestType)
}

class FavoriteDetailPhotoInteractor: FavoriteDetailPhotoBusinessLogic {

  var presenter: FavoriteDetailPhotoPresentationLogic?
  var service: FavoriteDetailPhotoService?

  func makeRequest(request: FavoriteDetailPhoto.Model.Request.RequestType) {
    if service == nil {
      service = FavoriteDetailPhotoService()
    }
  }

}
