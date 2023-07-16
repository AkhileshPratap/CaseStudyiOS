//
//  NewsListViewModel.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 16/07/23.
//

import Foundation
import Combine

enum LoadingStatus {
    case none
    case loading
    case loaded
}

class NewsListViewModel: ObservableObject {
    @Published var emailedResults: [Result] = []
    @Published var sharedResults: [Result] = []
    @Published var viewedResults: [Result] = []

    @Published var loadingStatus = LoadingStatus.none

    private var cancellables = Set<AnyCancellable>()


    private var service: NetworkProtocol

    init( service: NetworkProtocol = NetworkClient()) {
        self.service = service
        downloadData()
    }

    func downloadData() {
        loadingStatus = .loading
        fetchEmailedData()
        fetchSharedData()
        fetchViewedData()
    }

    private func fetchEmailedData() {
        let endPoint = NewsPlacesEnpoint.mostPopularEmailed(key: "iSNKnWtdEJJgwP1l0dcYFXpz7fwhAS4J")
        service.request(with: NewsModel.self, endpoint: endPoint)
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { model in
                self.emailedResults = model.results
            }
            .store(in: &cancellables)

    }

    private func fetchSharedData() {
        let endPoint = NewsPlacesEnpoint.mostPopularShared(key: "iSNKnWtdEJJgwP1l0dcYFXpz7fwhAS4J")
        service.request(with: NewsModel.self, endpoint: endPoint)
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { model in
                self.sharedResults = model.results
            }
            .store(in: &cancellables)

    }

    private func fetchViewedData() {
        let endPoint = NewsPlacesEnpoint.mostPopularViewed(key: "iSNKnWtdEJJgwP1l0dcYFXpz7fwhAS4J")
        service.request(with: NewsModel.self, endpoint: endPoint)
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { model in
                self.viewedResults = model.results
            }
            .store(in: &cancellables)

    }

}
