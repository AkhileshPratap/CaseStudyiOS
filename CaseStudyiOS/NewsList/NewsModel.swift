//
//  NewsModel.swift
//  CaseStudyiOS
//
//  Created by AkhileshSingh on 16/07/23.
//

import Foundation

struct NewsModel: Codable {
    var status: String
    var numResults: Int?
    var results: [Result]
}

struct Result: Codable, Identifiable {
    var id: Int
    var title: String
    var media: [Media]
}

struct Media: Codable {
    var mediaMetadata: [MediaMetadata]

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Codable {
    var url: String
}
