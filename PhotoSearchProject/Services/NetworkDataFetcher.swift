//
//  NetworkDataFetcher.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import Foundation

protocol DataFetcherPhotosProtocol {
    func getImageBySearch(search: String, completion: @escaping (SearchResults?) -> Void)
    func getImageRandom(completion: @escaping ([Photo]?) -> Void)
}

protocol DataFetcherDetailPhotoProtocol {
    func getDetailImage(idPhoto: String, completion: @escaping (Photo?) -> Void)
}

class NetworkDataFetcher {

    let networkService: NetworkingProtocol

    init(networkService: NetworkingProtocol) {
        self.networkService = networkService
    }

    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }

        do {
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch let jsonError {
            print("Не смог раскодировать данные", jsonError )
            return nil
        }
    }
}

//MARK: - DataFetcherPhotosProtocol
extension NetworkDataFetcher: DataFetcherPhotosProtocol {
    func getImageBySearch(search: String, completion: @escaping (SearchResults?) -> Void) {
        networkService.requestPhotoSearch(search: search) { (data, error) in
            if let error = error {
                print("Error request data: \(error.localizedDescription)")
                completion(nil)
            }

            let decode = self.decodeJSON(type: SearchResults.self, from: data)
            completion(decode)
        }
    }

    func getImageRandom(completion: @escaping ([Photo]?) -> Void) {
        networkService.requestPhotoRandom { (data, error) in
            if let error = error {
                print("Error request data: \(error.localizedDescription)")
                completion(nil)
            }

            let decode = self.decodeJSON(type: [Photo].self, from: data)
            completion(decode)
        }
    }
}

//MARK: - DataFetcherDetailPhotoProtocol
extension NetworkDataFetcher: DataFetcherDetailPhotoProtocol {
    func getDetailImage(idPhoto: String, completion: @escaping (Photo?) -> Void) {
        networkService.requestPhoto(idPhoto: idPhoto) { (data, error) in
            if let error = error {
                print("Error request data: \(error.localizedDescription)")
                completion(nil)
            }

            let decode = self.decodeJSON(type: Photo.self, from: data)
           // print(decode?.urls["regular"])
            completion(decode)
        }
    }
}
