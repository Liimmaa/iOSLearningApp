//
//  NetworkManager.swift
//  NetworkLayers
//
//  Created by Chioma Amanda Mmegwa  on 03/11/2022.
//

import Foundation

protocol NetworkManaging {
    func getNews(keyword: String, sortBy: String?, completion: @escaping (_ news: [News]?, _ error: Error?) -> Void)
}

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum AppError {
    case network
    case unableToDecode
    case custom(errorDescription: String?)
}

extension AppError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .network:
            return NetworkResponse.failed.rawValue
        case .unableToDecode:
            return NetworkResponse.unableToDecode.rawValue
        case .custom(let errorDescription): return errorDescription
        }
    }
}

enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager: NetworkManaging {
    static let environment: NetworkEnvironment = .production
    static let NewsApiKey = "e8e98d4878a14ce483490832eb001d8e"
    let router = Router<NewsApi>()
    func getNews(keyword: String, sortBy: String?, completion: @escaping (_ news: [News]?, _ error: Error?) -> Void) {
        router.request(.allNews(keyword: keyword, sortBy: sortBy)) { data, response, error in
            if error != nil {
                completion(nil, AppError.custom(errorDescription: "Please check your network connection"))
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, error)
                        return
                    }
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        let apiResponse = try JSONDecoder().decode(NewsApiResponse.self, from: responseData)
                        completion(apiResponse.news, nil)
                    } catch {
                        print(error)
                        completion(nil, AppError.unableToDecode)
                    }
                case .failure:
                    completion(nil, AppError.unableToDecode)
                }
            }
        }
    }
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
