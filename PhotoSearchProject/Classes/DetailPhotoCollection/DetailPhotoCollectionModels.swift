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
                case displayDetailsPhoto
            }
        }
    }
}

struct detailsPhotoViewModel {
    
}
