//
//  NetworkDataFetcher.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import Foundation

typealias Handler<T: Decodable> = Result<T,APIError>

protocol DataFetcherPhotosProtocol {
    func getImageBySearch(search: String, completion: @escaping (Handler<SearchResults>) -> Void)
    func getImageRandom(completion: @escaping (Handler<[Photo]>) -> Void)
}

protocol DataFetcherDetailPhotoProtocol {
    func getDetailImage(idPhoto: String, completion: @escaping (Handler<Photo>) -> Void)
}

class NetworkDataFetcher {

    let networkService: NetworkingProtocol

    init(networkService: NetworkingProtocol) {
        self.networkService = networkService
    }

    private func getResult<T: Decodable>(urlResponse: HTTPURLResponse,type: T.Type ,data: Data?) -> Handler<T>{
        switch urlResponse.statusCode {
        case 200:
            let decode = self.decodeJSON(type: type.self, from: data)
            return decode
        case 400:
            return .failure(.invalidRequestError(""))
        case 401:
            return .failure(.invalidAccessToken)
        case 403:
            return .failure(.requestDenied)
        case 404:
            return .failure(.notFound)
        case 500..<504:
            return .failure(.serverSideError)
        default:
            print("somthing gone wrong \(urlResponse.statusCode)")
            return .failure(.serverSideError)
        }
    }

    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> Handler<T> {
        let decoder = JSONDecoder()
        guard let data = from else { return .failure(APIError.invalidResponse)  }

        do {
            let object = try decoder.decode(type.self, from: data)
            return .success(object)
        } catch DecodingError.dataCorrupted(let context){
            print(DecodingError.dataCorrupted(context))
            return .failure(APIError.dataCorrupted(context))
        } catch DecodingError.keyNotFound(let key, let context) {
            return .failure(APIError.keyNotFound(key, context))
        } catch DecodingError.typeMismatch(let type, let context) {
            return .failure(APIError.typeMismatch(type, context))
        } catch DecodingError.valueNotFound(let value, let context) {
            return .failure(APIError.valueNotFound(value, context))
        } catch let error {
            return .failure(APIError.failedDecodeData(error))
        }
    }
}

//MARK: - DataFetcherPhotosProtocol
extension NetworkDataFetcher: DataFetcherPhotosProtocol {
    func getImageBySearch(search: String, completion: @escaping (Handler<SearchResults>) -> Void) {
        networkService.requestPhotoSearch(search: search) { (data, response, error) in
            if let error = error {
                completion(.failure(.transportError(error)))
            }

            guard let urlResponse = response as? HTTPURLResponse else { return
                completion(.failure(.invalidResponse)) }

            let getResult = self.getResult(urlResponse: urlResponse, type: SearchResults.self, data: data)
            completion(getResult)
        }
    }

    func getImageRandom(completion: @escaping (Handler<[Photo]>) -> Void) {
        networkService.requestPhotoRandom { (data, response, error) in

            if let error = error {
                completion(.failure(.transportError(error)))
            }

            guard let urlResponse = response as? HTTPURLResponse else { return
                completion(.failure(.invalidResponse)) }

            let getResult = self.getResult(urlResponse: urlResponse, type: [Photo].self, data: data)
            completion(getResult)
        }
    }
}

//MARK: - DataFetcherDetailPhotoProtocol
extension NetworkDataFetcher: DataFetcherDetailPhotoProtocol {
    func getDetailImage(idPhoto: String, completion: @escaping (Handler<Photo>) -> Void) {
        networkService.requestPhoto(idPhoto: idPhoto) { (data, response, error) in
        if let error = error {
            completion(.failure(.transportError(error)))
        }

        guard let urlResponse = response as? HTTPURLResponse else { return
            completion(.failure(.invalidResponse)) }

        let getResult = self.getResult(urlResponse: urlResponse, type: Photo.self, data: data)
        completion(getResult)
        }
    }
}
