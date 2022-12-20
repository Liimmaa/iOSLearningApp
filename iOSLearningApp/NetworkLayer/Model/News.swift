//
//  News.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 09/11/2022.
//

import Foundation
struct NewsApiResponse {
    let news: [News]
}

extension NewsApiResponse: Decodable {
    private enum NewsApiResponseCodingKeys: String, CodingKey {
        case news = "articles"
}

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: NewsApiResponseCodingKeys.self)
        news = try container.decode([News].self, forKey: .news)
    }
}

struct News {
    let id = UUID()
    let source: Source
    let title: String
    let description: String
    let image: String
    let publishTime: String
    let content: String
}

extension News: Decodable, Identifiable {

    private enum NewsCodingKeys: String, CodingKey {
        case source
        case title
        case description
        case image = "urlToImage"
        case publishTime = "publishedAt"
        case content
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: NewsCodingKeys.self)
        source = try container.decode(Source.self, forKey: .source)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        image = try container.decode(String.self, forKey: .image)
        publishTime = try container.decode(String.self, forKey: .publishTime)
        content = try container.decode(String.self, forKey: .content)
    }
}

struct Source: Decodable {
    let name: String
    private enum SourceCodingKeys: String, CodingKey {
        case name
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SourceCodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
}
