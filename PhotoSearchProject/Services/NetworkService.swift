//
//  NetworkService.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import Foundation

protocol NetworkingProtocol {
    func requestPhotoSearch(search: String, completion: @escaping (Data?, Error?) -> Void)
    func requestPhotoRandom(completion: @escaping (Data?, Error?) -> Void)
    func requestPhoto(idPhoto: String, completion: @escaping (Data?, Error?) -> Void)
}

class NetworkService: NetworkingProtocol {

    func requestPhotoSearch(search: String, completion: @escaping (Data?, Error?) -> Void) {
        let parameters = setupParameters(search: search)
        let url = url(path: ApiPath.searchPhotos, params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = setupHeaders()
        request.httpMethod = HTTPMethod.get.rawValue
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    func requestPhotoRandom(completion: @escaping (Data?, Error?) -> Void) {
        var parameters = [String: String]()
        parameters[Parameter.count] = String(20)
        let url = url(path: ApiPath.photosRandom, params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = setupHeaders()
        request.httpMethod = HTTPMethod.get.rawValue
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    func requestPhoto(idPhoto: String, completion: @escaping (Data?, Error?) -> Void) {
        let parameters = [String: String]()
        let path = ApiPath.detailPhoto + idPhoto
        let url = url(path: path, params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = setupHeaders()
        request.httpMethod = HTTPMethod.get.rawValue
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    //MARK: -  private methods
    private func setupParameters(search: String?) -> [String: String] {
        var parameters = [String: String]()
        parameters[Parameter.query] = search
        parameters[Parameter.page] = String(1)
        parameters[Parameter.perPage] = String(25)
        return parameters
    }

    private func url(path: String, params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = path
        components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        return components.url!
    }

    private func setupHeaders() -> [String: String] {
        var headers = [String: String]()
        headers[Header.auth] = "Client-ID 2-2pWj3hZMqjMUmMqUBAPdqdwBnLIDrkrCrWcLPi834"
        return headers
    }

    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (date, response, error) in
            DispatchQueue.main.async {
                completion(date,error)
            }
        }
    }
}
