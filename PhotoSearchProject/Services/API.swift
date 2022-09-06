//
//  API.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.unsplash.com"
}

struct ApiPath {
    static let searchPhotos = "/search/photos"
    static let photosRandom = "/photos/random"
    static let detailPhoto = "/photos/"
}

struct Parameter {
    static let query = "query"
    static let page = "page"
    static let perPage = "per_page"
    static let count = "count"
    static let id = "id"
}

struct Header {
    static let auth = "Authorization"
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}
