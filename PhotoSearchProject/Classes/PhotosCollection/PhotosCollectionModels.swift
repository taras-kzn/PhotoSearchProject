//
//  PhotosCollectionModels.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.

import UIKit

enum PhotosCollection {
    
    enum Model {
        struct Request {
            enum RequestType {
                case getPhotosRandom
                case getImageBySearch(search: String)
            }
        }
        struct Response {
            enum ResponseType {
                case presentPhotosRandom(photos: [Photo])
                case presentImageBySearch(photos: SearchResults)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayPhotosRandom(photosViewModel: [PhotosViewModel])
                case displayImageBySearch(photosViewModel: [PhotosViewModel])
            }
        }
    }
}

struct PhotosViewModel: photoCellViewModel{
    var id: String
    var width: Int
    var height: Int
    var photoUrlRegularSize: String
}
