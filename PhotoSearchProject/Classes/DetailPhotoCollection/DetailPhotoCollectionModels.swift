//
//  DetailPhotoCollectionModels.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

enum DetailPhotoCollection {

    enum Model {
        struct Request {
            enum RequestType {
                case getDetailsPhoto
                case addPhoto(favoritePhotos: [DetailsPhotoViewModel])
            }
        }
        struct Response {
            enum ResponseType {
                case presentDetailsPhoto(photo: Photo)
                case presentAddedPhoto(favoritePhotos: [DetailsPhotoViewModel])
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayDetailsPhoto(detailsPhotoViewModel: DetailsPhotoViewModel)
                case displayAddedPhoto(detailsPhotoViewModel: [DetailsPhotoViewModel])
            }
        }
    }
}

struct DetailsPhotoViewModel: FavoritePhotoViewModelProtocols {
    var name: String
    let date: String
    let location: String
    let download: String
    let created_at: String
    var photoUrlString: String
}
