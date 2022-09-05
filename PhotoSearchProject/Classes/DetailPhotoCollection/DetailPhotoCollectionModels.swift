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
            }
        }
        struct Response {
            enum ResponseType {
                case presentDetailsPhoto(photo: Photo)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayDetailsPhoto(detailsPhotoViewModel: DetailsPhotoViewModel)
            }
        }
    }
}

struct DetailsPhotoViewModel {
    let name: String
    let date: String
    let location: String 
    let download: String
    let photoUrlString: String
}
