//
//  DateFormatter.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 06.09.2022.
//

import Foundation

class WorkerDateFormatter {
    static let shared = WorkerDateFormatter()

    private init() {}

     func getFormattedDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: dateString)
        guard let date = date else {return "no date"}
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let result = dateFormatter.string(from: date)
        return result
    }
}
