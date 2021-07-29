//
//  Contstants.swift
//  NetworkTestApp
//
//  Created by Andrey Khyshov on 23.07.2021.
//

enum Constants {
    enum TwitchKeys {
        static let twitchClienID = "ru6llkx9f102oru2jl34dgivkaiv3s"
        static let twitchSecret = "3up7vo7r9wke0o5i7j3uiufegy3g3p"
    }

    enum TwitchAPIMethods {
        static let getGames = "https://api.twitch.tv/helix/games/top"
        static let authorize = "https://id.twitch.tv/oauth2/token"
    }
}
