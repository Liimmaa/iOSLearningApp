//
//  NewsListViewModel.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 28/11/2022.
//

import Foundation

class NewsListViewModel: StateMachine<NewsListState, NewsListEvent> {

    private let networkManager: NetworkManaging

    init(networkManager: NetworkManaging) {
        self.networkManager = networkManager
        super.init(.initial)
    }

    var news: [News] = []

    override func handleStateUpdate(_ oldState: NewsListState, new newState: NewsListState) {
        switch(oldState, newState) {
        case(.initial, .loading):
            break
        case(.loading, .results):
            break
        case(.loading, .empty):
            news = []
            stateError = nil
        case(.error, .loading):
            stateError = nil
        case(.loading, .error),
            (.empty, .loading):
            news = []
        default:
            fatalError("You landed in a mysterious place... Coming from \(oldState) and trying to get to \(newState)")
        }
    }

    override func handleEvent(_ event: NewsListEvent) -> NewsListState? {
        switch(state, event) {
        case(.initial, .onAppear):
            fetchData()
            return .loading
        case(.loading, .didFetchResultsSuccessfully(let results)):
            news = results
            return .results
        case(.loading, .didFetchResultsFailure(let error)):
            stateError = error
            return .error
        default:
            fatalError("Event not handled...")
        }
    }

    private func fetchData() {
        networkManager.getNews(keyword: "russia-war", sortBy: "") { news, error in
            if let news = news {
                DispatchQueue.main.async {
                    self.send(event: .didFetchResultsSuccessfully(news))
                }
            } else if let error = error {
                self.send(event: .didFetchResultsFailure(error))
            }
        }
    }
}
