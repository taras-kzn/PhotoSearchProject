//
//  APIError.swift
//  PhotoSearchProject
//
//  Created by Denis Tarasov on 08.09.2022.
//

import Foundation
import SwiftUI

enum APIError: LocalizedError {
    case invalidRequestError(String)
    case transportError(Error)
    case invalidResponse
    case dataCorrupted(DecodingError.Context)
    case keyNotFound(CodingKey, DecodingError.Context)
    case typeMismatch(Any.Type, DecodingError.Context)
    case valueNotFound(Any.Type, DecodingError.Context)
    case failedDecodeData(Error)
    case invalidAccessToken
    case requestDenied
    case notFound
    case serverSideError

    var errorDescription: String? {
        switch self {
        case .invalidRequestError(let message):
            return "Неверный запрос: \(message)"
        case .transportError(let error):
            return "транспортная ошибка: \(error)"
        case .invalidResponse:
            return "Неверный ответ"
        case .dataCorrupted(let context):
            return "данные повреждены: \(context)"
        case .keyNotFound(let key, let context):
            return "ключ не найден: ключ -> \(key), \(context)"
        case .typeMismatch(let type, let context):
            return "несоответствие типов: \(type) , \(context)"
        case .valueNotFound(let value, let context):
            return "значение не найдено: \(value) , \(context)"
        case .failedDecodeData(let error):
            return "Не смог раскодировать данные, \(error)"
        case .invalidAccessToken:
            return "Неверный токен доступа"
        case .requestDenied:
            return "Отсутствуют разрешения на выполнение запроса"
        case .notFound:
            return "Запрошенный ресурс не существует"
        case .serverSideError:
            return "Ошибка со стороны сервера"
        }
    }
}
