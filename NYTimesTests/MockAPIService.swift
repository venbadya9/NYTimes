import Foundation
@testable import NYTimes

class MockAPIService: Service {
    
    var articleList: ArticleList?
    var error: APIError?
    
    func makeRequest<T>(with request: URLRequest, respModel: T.Type, completion: @escaping (T?, NYTimes.APIError?) -> Void) where T : Decodable, T : Encodable {
        completion (articleList as? T, error)
    }
    
    func fetchArticles() -> ArticleList? {
        do {
            guard let fileUrl = Bundle.main.url(forResource: "Article", withExtension: "json") else { return nil }
            let data = try Data(contentsOf: fileUrl)
            return try JSONDecoder().decode(ArticleList.self, from: data)
        } catch {
            return nil
        }
    }
}
