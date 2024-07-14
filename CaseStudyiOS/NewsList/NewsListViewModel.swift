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
        fetchEmailedData()
        fetchSharedData()
        fetchViewedData()
    }

    private func fetchEmailedData() {
        let endPoint = NewsPlacesEnpoint.mostPopularEmailed(key: SavedKeys.key)
        loadingStatus = .loading
        service.request(with: NewsModel.self, endpoint: endPoint)
            .sink {[weak self] result in
                switch result {
                case .finished:
                    break
                case .failure:
                    self?.loadingStatus = .none
                }
            } receiveValue: {[weak self] model in
                self?.emailedResults = model.results
                self?.loadingStatus = .loaded
            }
            .store(in: &cancellables)

    }

    private func fetchSharedData() {
        let endPoint = NewsPlacesEnpoint.mostPopularShared(key: SavedKeys.key)
        loadingStatus = .loading
        service.request(with: NewsModel.self, endpoint: endPoint)
            .sink {[weak self] result in
                switch result {
                case .finished:
                    break
                case .failure:
                    self?.loadingStatus = .loaded
                }
            } receiveValue: {[weak self] model in
                self?.sharedResults = model.results
                self?.loadingStatus = .loaded
            }
            .store(in: &cancellables)

    }

    private func fetchViewedData() {
        cancellables.removeAll()
        let endPoint = NewsPlacesEnpoint.mostPopularViewed(key: SavedKeys.key)
        loadingStatus = .loading
        service.request(with: NewsModel.self, endpoint: endPoint)
            .sink {[weak self] result in
                switch result {
                case .finished:
                    break
                case .failure:
                    self?.loadingStatus = .loaded
                }
            } receiveValue: {[weak self] model in
                self?.viewedResults = model.results
                self?.loadingStatus = .loaded
            }
            .store(in: &cancellables)

    }

}
