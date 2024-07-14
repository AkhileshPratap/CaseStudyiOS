//
//  Endpoint.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 15/07/23.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum HTTPScheme: String {
    case http
    case https
}

protocol Endpoint {
    var scheme: HTTPScheme { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem] { get }
    var method: HTTPMethod { get }
}

extension Endpoint {

    var scheme: HTTPScheme {
        return .https
    }

    var baseURL: String {
        return BaseURL.news
    }

    var method: HTTPMethod {
        return .get
    }

    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = baseURL
        components.path = path
        components.queryItems = parameters
        return components.url
    }
}
