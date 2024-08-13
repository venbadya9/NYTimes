import XCTest
import Combine

@testable import NYTimes

class ArticleViewModelTest: XCTestCase {
    
    func testAPIError() {
        let mockService = MockAPIService()
        mockService.articleList = nil
        mockService.error = .invalidResponse
        let sut = ArticleViewModel(service: mockService)
        sut.postRequest()
        XCTAssert(sut.articles.isEmpty)
    }
    
    func testAPISuccess() {
        let mockService = MockAPIService()
        guard let articles = mockService.fetchArticles() else { return }
        mockService.articleList = articles
        mockService.error = nil
        let sut = ArticleViewModel(service: mockService)
        let expectation = XCTestExpectation(description: "Fetching Articles")
        let cancellable : AnyCancellable
        cancellable = sut.$articles
            .dropFirst()
            .sink(receiveValue: { value in
                expectation.fulfill()
            })
        sut.postRequest()
        wait(for: [expectation], timeout: 5.0)
        XCTAssert(!sut.articles.isEmpty)
    }
}
