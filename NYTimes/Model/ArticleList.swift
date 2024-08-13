import Foundation

// MARK: Article
struct ArticleList: Codable {
    let articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case articles = "results"
    }
}

// MARK: Result
struct Article: Codable, Identifiable {
    let url: String
    let id: Int
    let publishedDate: String
    let byline: String
    let title: String
    let media: [Media]
    
    enum CodingKeys: String, CodingKey {
        case url, id
        case publishedDate = "published_date"
        case byline, title
        case media
    }
}

// MARK: Media
struct Media: Codable {
    let mediaMetadata: [MediaMetadatum]
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - Media MetaData
struct MediaMetadatum: Codable {
    let url: String
}
