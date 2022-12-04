//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 02/12/2022.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
