//
//  NewsListState.swift
//  iOSLearningApp
//
//  Created by Chioma Amanda Mmegwa  on 28/11/2022.
//

import Foundation

enum NewsListState: Equatable {
    case initial
    case loading
    case results
    case empty
    case error
}

enum NewsListEvent {
    case onAppear
    case retry
    case reload
    case fetchNextPage
    case didFetchResultsSuccessfully
    case didFetchResultsFailure(_ error: Error)
    case didFetchResultsEmpty
}
