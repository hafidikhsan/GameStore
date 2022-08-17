//
//  HomeList.swift
//  GameStore
//
//  Created by Hafid Ikhsan Arifin on 15/08/22.
//

import Foundation

struct HomeListModel: Codable {
    let results: [GameList]
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct GameList: Codable {
    let id: Int
    let slug: String
    let name: String
    let released: String?
    let backgroundImage: String?
    let rating: Double
    let genres: [Genres]?
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
        case released
        case backgroundImage = "background_image"
        case rating
        case genres
    }
}

struct Genres: Codable {
    let id: Int
    let slug: String
    let name: String
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
    }
}
