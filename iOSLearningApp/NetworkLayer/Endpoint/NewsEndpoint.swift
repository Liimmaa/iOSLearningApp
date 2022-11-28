//
//  NewsEndpoint.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 09/11/2022.
//

import Foundation

enum NetworkEnvironment {
    case production
    case staging
}

public enum NewsApi {
    case allNews(keyword: String, sortBy: String?)
}

extension NewsApi: EndPointType {
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production: return "https://newsapi.org/v2/"
        case .staging: return ""
        }
    }
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could  not be configured.")}
        return url
    }
    var path: String {
        switch self {
        case .allNews:
            return "everything"
        }
    }
    var httpMethod: HTTPMethod {
        return .get
    }
    var task: HTTPTask {
        switch self {
        case .allNews(let keyword, let sortBy):
            return .requestParameters(bodyParameters: nil,
                                      urlParameters: ["q": keyword,
                                                      "sortBy": sortBy ?? "popularity",
                                                      "apiKey": NetworkManager.NewsApiKey])
        }
    }
    var headers: HTTPHeaders? {
        return nil
    }
}
