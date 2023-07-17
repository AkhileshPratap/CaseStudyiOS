//
//  NewsListTests.swift
//  CaseStudyiOSTests
//
//  Created by AkhileshSingh on 17/07/23.
//

import XCTest
@testable import CaseStudyiOS
import Combine

final class NewsListTests: XCTestCase {
    var mockNetworkClient: MockNetworkClient!

    override func setUp() {
        mockNetworkClient = MockNetworkClient()
    }

    func test_emailedList_in_viewModel() {
        let sut = NewsListViewModel(service: MockNetworkClient())
        let expectation = XCTestExpectation()
        sut.downloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.emailedResults.count, 1)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_sharedList_in_viewModel() {
        let sut = NewsListViewModel(service: MockNetworkClient())
        let expectation = XCTestExpectation()
        sut.downloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.sharedResults.count, 1)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }

    func test_viewedList_in_viewModel() {
        let sut = NewsListViewModel(service: MockNetworkClient())
        let expectation = XCTestExpectation()
        sut.downloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            XCTAssertEqual(sut.viewedResults.count, 1)
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
    }


    func test_emailed_news_results() {
        let endpoint = NewsPlacesEnpoint.mostPopularEmailed(key: "someKey")
        let expectation = XCTestExpectation()
        let expectedResponse = NewsModel(status: "200",
                                         numResults: 20,
                                         results: [Result(id: 1, title: "some title", media: [Media(mediaMetadata: [MediaMetadata(url: "some url")])])])

        mockNetworkClient.request(with: NewsModel.self, endpoint: endpoint)
            .sink { result in
                switch result {
                case .failure:
                    break
                case .finished:
                    break
                }
            } receiveValue: { response in
                XCTAssertEqual(response.status, expectedResponse.status)
                expectation.fulfill()
            }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_emailed_news_results_failed() {
        let endpoint = NewsPlacesEnpoint.mostPopularEmailed(key: "")
        let expectation = XCTestExpectation()
        let expectedResponse = NewsModel(status: "200",
                                         numResults: 20,
                                         results: [Result(id: 1, title: "some title", media: [Media(mediaMetadata: [MediaMetadata(url: "some url")])])])
        mockNetworkClient.success = false
        mockNetworkClient.request(with: NewsModel.self, endpoint: endpoint)
            .sink { result in
                switch result {
                case .failure(let error):
                    XCTAssertEqual(error, .unknown)
                    expectation.fulfill()
                case .finished:
                    break
                }
            } receiveValue: { response in
                XCTAssertEqual(response.status, expectedResponse.status)
                expectation.fulfill()
            }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_shared_news_results() {
        let endpoint = NewsPlacesEnpoint.mostPopularShared(key: "someKey")
        let expectation = self.expectation(description: "Emailed expectation")
        let expectedResponse = NewsModel(status: "200",
                                         numResults: 20,
                                         results: [Result(id: 1, title: "some title", media: [Media(mediaMetadata: [MediaMetadata(url: "some url")])])])

        mockNetworkClient.request(with: NewsModel.self, endpoint: endpoint)
            .sink { result in
                switch result {
                case .failure:
                    break
                case .finished:
                    break
                }
            } receiveValue: { response in
                XCTAssertEqual(response.status, expectedResponse.status)
                expectation.fulfill()
            }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_viewed_news_results() {
        let endpoint = NewsPlacesEnpoint.mostPopularViewed(key: "")
        let expectation = self.expectation(description: "Emailed expectation")
        let expectedResponse = NewsModel(status: "200",
                                         numResults: 20,
                                         results: [Result(id: 1,
                                                          title: "some title",
                                                          media: [Media(
                                                            mediaMetadata: [MediaMetadata(url: "some url")])])])

        mockNetworkClient.request(with: NewsModel.self, endpoint: endpoint)
            .sink { result in
                switch result {
                case .failure:
                    break
                case .finished:
                    break
                }
            } receiveValue: { response in
                XCTAssertEqual(response.status, expectedResponse.status)
                expectation.fulfill()
            }

        wait(for: [expectation], timeout: 1.0)
    }
}

class MockNetworkClient: NetworkProtocol {
    // swiftlint:disable force_cast
    var success: Bool = true
    func request<T>(with type: T.Type, endpoint: Endpoint) -> AnyPublisher<T, APIError> {

        if success {
            return Just(NewsModel(status: "200",
                                  numResults: 20,
                                  results: [Result(id: 1,
                                                   title: "some title",
                                                   media: [Media(
                                                    mediaMetadata: [MediaMetadata(url: "some url")])])]) as! T)
            .setFailureType(to: APIError.self)
            .eraseToAnyPublisher()
        } else {
            return Fail(error: APIError.unknown)
                .eraseToAnyPublisher()
        }

    }
}
