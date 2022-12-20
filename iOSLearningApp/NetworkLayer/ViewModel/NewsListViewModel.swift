
//
//  NewsListViewModel.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 28/11/2022.
//

import Foundation

struct NewsResult {
    var trendingNews: [News]
    var popularNews: [News]
}

final class NewsListViewModel: StateMachine<NewsListState, NewsListEvent> {

    private let networkManager: NetworkManaging
    var news: NewsResult = NewsResult(trendingNews: [], popularNews: [])

    init(networkManager: NetworkManaging) {
        self.networkManager = networkManager
        super.init(.initial)
    }

    override func handleStateUpdate(_ oldState: NewsListState, new newState: NewsListState) {
        switch(oldState, newState) {
        case(_, .loading),
            (.loading, .results),
            (.results, .results):
            break
        case(.loading, .empty):
            news =  NewsResult(trendingNews: [], popularNews: [])
            stateError = nil
        case(.loading, .error):
            news =  NewsResult(trendingNews: [], popularNews: [])
        default:
            fatalError("You landed in a mysterious place... Coming from \(oldState) and trying to get to \(newState)")
        }
    }

    override func handleEvent(_ event: NewsListEvent) -> NewsListState? {
        switch(state, event) {
        case(_, .onAppear):
            fetchData()
            return .loading
        case(.loading, .didFetchResultsSuccessfully):
            return .results
        case(.results, .didFetchResultsSuccessfully):
            return .results
        case(_, .didFetchResultsFailure(let error)):
            stateError = error
            return .error
        default:
            return .error
        }
    }

    private func fetchData() {
        getNewsResult(sortBy: .trending)
        getNewsResult(sortBy: .popular)
    }

    func getNewsResult(sortBy: SortNews) {
        networkManager.getNews(keyword: Constants.keyword, sortBy: sortBy.rawValue, completion: { news, error in
            if let news = news {
                DispatchQueue.main.async {
                    switch sortBy {
                    case .trending:
                        self.news.trendingNews = news
                    case .popular:
                        self.news.popularNews = news
                    }
                    self.send(event: .didFetchResultsSuccessfully)
                }
            } else if let error = error {
                self.send(event: .didFetchResultsFailure(error))
            }
        })
    }
}

enum SortNews: String {
    case trending = ""
    case popular = "popularity"
}
