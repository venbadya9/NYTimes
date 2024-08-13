import SwiftUI

final class ArticleViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    @Published var hasError = false
    @Published var error: String?
    @Published var isLoading = true
    
    var service: Service!
    
    let articleUrlString = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=558qROrjDdLpoa7EyH3OfvtkUHRflGfA"

    
    init(service: Service = APIService()) {
        self.articles = articles
        self.service = service
    }
    
    func postRequest() {
        
        hasError = false
        
        guard let url = URL(string: articleUrlString) else { return }
        let request = URLRequest(url: url)
        
        service.makeRequest(with: request, respModel: ArticleList.self) { [weak self] data, error in
            DispatchQueue.main.async {
                self?.isLoading = false
                    if let error = error {
                        self?.hasError = true
                        self?.error = error.rawValue
                    } else {
                        if let articleInfo = data {
                            self?.articles = articleInfo.articles
                        }
                    }
            }
        }
    }
}
