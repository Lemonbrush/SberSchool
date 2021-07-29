//
//  GetGamesResponse.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 23.07.2021.
//

import Foundation

struct GetGamesResponse: Decodable {
    let data: [GetGamesDataResponse]
    let pagination: GetGamesPaginationResponse
}

struct GetGamesDataResponse: Decodable {
    let boxArtUrl: String
    let id: String
    let name: String
}

struct GetGamesPaginationResponse: Decodable {
    let cursor: String
}

