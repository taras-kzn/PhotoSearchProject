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
                case getCalculationCellSize(photoHeight: Int, photoWidth: Int, viewWidth: CGFloat)
            }
        }
        struct Response {
            enum ResponseType {
                case presentPhotosRandom(photos: [Photo])
                case presentImageBySearch(photos: SearchResults)
                case presentCalculationCellSize(width: CGFloat, height: CGFloat, sectionInserts: UIEdgeInsets)
            }
        }
        struct ViewModel {
            enum ViewModelData {
                case displayPhotosRandom(photosViewModel: [PhotosViewModel])
                case displayImageBySearch(photosViewModel: [PhotosViewModel])
                case displayCalculationCellSize(sizeCellViewModel: SizeCellViewModel)
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

struct SizeCellViewModel {
    var sizeCell: CGSize = CGSize(width: 1, height: 1)
    var sectionInserts: UIEdgeInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    var sectionInsertsLeft: CGFloat = 1
}
