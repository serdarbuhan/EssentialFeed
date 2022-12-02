//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 02/12/2022.
//

import Foundation

// other modules(test) can conform to this protocol
public protocol HTTPClient {
    func get(from url: URL)
}

// don't want other modules to subclass for now that's why final
// we want other modules to access this class, initializer and load method
// rest is private

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load() {
        client.get(from: url)
    }
}
