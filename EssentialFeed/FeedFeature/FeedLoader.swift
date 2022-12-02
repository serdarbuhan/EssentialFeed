//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 02/12/2022.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
    // starting with abstractions is a bear risk. over abstracting to accomodate future needs (that will never happen) can unnecessarily damage/complicate the current design
    // at the same time in error case, choosing a concrete error type at this time might be trying to make too many upfront decisions
    // Good design is rerely achieved in the first iteration.
}

protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
