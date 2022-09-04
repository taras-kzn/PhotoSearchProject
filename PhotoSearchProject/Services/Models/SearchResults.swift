//
//  SearchResults.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 04.09.2022.
//

import Foundation

struct SearchResults: Decodable {
    let total: Int
    let results: [Photo]
}

struct Photo: Decodable {
    let id: String
    let width: Int
    let height: Int
    let created_at: String
    let urls: [URLKing.RawValue: String]
    let user: User

    enum URLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}

struct User: Decodable {
    let name: String
}
