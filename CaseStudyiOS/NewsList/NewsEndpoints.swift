//
//  NewsEndpoints.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 15/07/23.
//

import Foundation

enum NewsPlacesEnpoint: Endpoint {
    case mostPopularEmailed(key: String)
    case mostPopularShared(key: String)
    case mostPopularViewed(key: String)

    var path: String {
        switch self {
        case .mostPopularEmailed:
            return "/svc/mostpopular/v2/emailed/7.json"
        case .mostPopularShared:
            return "/svc/mostpopular/v2/shared/1/facebook.json"
        case .mostPopularViewed:
            return "/svc/mostpopular/v2/viewed/1.json"
        }
    }

    var parameters: [URLQueryItem] {
        switch self {
        case .mostPopularEmailed(let key):
            return [URLQueryItem(name: "api-key", value: key)]
        case .mostPopularShared(let key):
            return [URLQueryItem(name: "api-key", value: key)]
        case .mostPopularViewed(let key):
            return [URLQueryItem(name: "api-key", value: key)]
        }
    }

}
