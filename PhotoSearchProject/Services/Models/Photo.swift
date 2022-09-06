//
//  Photo.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 05.09.2022.
//

import Foundation

struct Photo: Decodable {
    let id: String
    let width: Int
    let height: Int
    let created_at: String
    let urls: [URLKing.RawValue: String]
    let user: User
    let downloads: Int?
    let location: Location?

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

struct Location: Decodable {
    let city: String?
    let country: String?
}
