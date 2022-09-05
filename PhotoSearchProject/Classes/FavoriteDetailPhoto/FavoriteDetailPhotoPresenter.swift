//
//  FavoriteDetailPhotoPresenter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoriteDetailPhotoPresentationLogic {
  func presentData(response: FavoriteDetailPhoto.Model.Response.ResponseType)
}

class FavoriteDetailPhotoPresenter: FavoriteDetailPhotoPresentationLogic {
  weak var viewController: FavoriteDetailPhotoDisplayLogic?

  func presentData(response: FavoriteDetailPhoto.Model.Response.ResponseType) {

  }

}
