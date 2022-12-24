//
//  FeedCache.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 24/12/2022.
//

import Foundation

public protocol FeedCache {
    typealias Result = Swift.Result<Void, Error>

    func save(_ feed: [FeedImage], completion: @escaping (Result) -> Void)
}
