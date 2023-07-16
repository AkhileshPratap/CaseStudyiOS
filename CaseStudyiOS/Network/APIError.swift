//
//  APIError.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 15/07/23.
//

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
