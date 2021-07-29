//
//  TwitchNetworkServiceProtocol.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 23.07.2021.
//

import Foundation
typealias GetGamesAPIResponse = Result<GetGamesResponse, NetworkServiceError>
typealias AuthorizeAPIResponse = Result<Void, NetworkServiceError>

protocol TwitchNetworkServiceProtocol {
    func authorize(completion: @escaping (AuthorizeAPIResponse) -> Void)
    func getGames(after cursor: String?, completion: @escaping (GetGamesAPIResponse) -> Void)
    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void)
}
