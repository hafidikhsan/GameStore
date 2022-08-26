import Foundation

struct DetailModel: Codable {
    let results: [GameDetail]
    enum CodingKeys: String, CodingKey {
        case results
    }
}

struct GameDetail: Codable {
    let id: Int
    let slug: String
    let name: String
    let originalName: String
    let description: String
    let released: String?
    let backgroundImage: String?
    let rating: Double
    let website: String
    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
        case originalName = "name_original"
        case description
        case released
        case backgroundImage = "background_image"
        case rating
        case website
    }
}
