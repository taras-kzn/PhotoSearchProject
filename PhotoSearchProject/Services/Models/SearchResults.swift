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
