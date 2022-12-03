//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 02/12/2022.
//

import Foundation

public protocol HTTPClient {
    // Client passes an error to the caller. RemoteFeedLoader in this case
    func get(from url: URL, completion: @escaping (Error) -> Void)
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient

    // RemoteFeedLoader's domain error.
    public enum Error: Swift.Error {
        case connectivity // maps client errors to connectivity error.
    }

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load(completion: @escaping (Error) -> Void = { _ in }) {
        client.get(from: url) { error in
            completion(.connectivity)
        }
    }
}
