//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 02/12/2022.
//

import Foundation

// made it public so RemoteFeedLoader can access
// made it equatable for assertion in tests
public struct FeedItem: Equatable {
    let id: UUID
    let description: String?
    let location: String?
    let imageURL: URL
}
