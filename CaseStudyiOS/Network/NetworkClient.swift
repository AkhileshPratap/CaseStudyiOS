//
//  Network.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 15/07/23.
//

import Foundation
import Combine

protocol NetworkProtocol {
    func request<T: Decodable>(with type: T.Type, endpoint: Endpoint) -> AnyPublisher<T, APIError>
}

final class NetworkClient: NetworkProtocol {

    func request<T: Decodable>(with type: T.Type, endpoint: Endpoint) -> AnyPublisher<T, APIError> {
        guard let url = endpoint.url else {
            return Fail(error: APIError.unknown).eraseToAnyPublisher()
        }
        print(url)
        var request = URLRequest(url: url)

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .mapError { _ in .unknown }
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                        return Just(data)
                            .decode(type: T.self, decoder: decoder)
                            .mapError {_ in .decodingError}
                            .eraseToAnyPublisher()
                    } else {
                        return Fail(error: APIError.httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown)
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()

    }

}
