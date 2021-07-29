//
//  NetworkServiceError.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 23.07.2021.
//

enum NetworkServiceError: Error {
    case unauthorize
    case network
    case decodable
    case unknown

    var message: String {
        switch self {
        case .network:
            return "Упал запрос"
        case .decodable:
            return "Не смогли распарсить"
        case .unauthorize:
            return "Вы не авторизованы"
        case .unknown:
            return "????"
        }
    }
}
