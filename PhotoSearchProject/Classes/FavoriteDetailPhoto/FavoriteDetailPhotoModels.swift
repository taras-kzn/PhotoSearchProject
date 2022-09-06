//
//  FavoriteDetailPhotoModels.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.

import UIKit

enum FavoriteDetailPhoto {

    enum Model {
        struct Request {
            enum RequestType {
                case getDetailsPhoto
            }
        }
        struct Response {
            enum ResponseType {
                case presentDetailsPhoto(photo: DetailsPhotoViewModel)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayDetailsPhoto(detailsPhotoViewModel: DetailsPhotoViewModel)
            }
        }
    }
}
