//
//  RemoteFeedLoader.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 02/12/2022.
//

import Foundation

public protocol HTTPClient {
    func get(from url: URL,
             completion: @escaping (Error?, HTTPURLResponse?) -> Void) // Either error or http url response.
                                    // optionals here is tricky, but will be handled later
}

public final class RemoteFeedLoader {
    private let url: URL
    private let client: HTTPClient

    public enum Error: Swift.Error {
        case connectivity
        case invalidData // domain error for non 200 http response
    }

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load(completion: @escaping (Error) -> Void) {
        client.get(from: url) { error, response in
            if response != nil {
                completion(.invalidData)
            } else {
                completion(.connectivity)
            }
            // if completion was here we would get error. capturing values in array in the test helps us to catch that
            // completion(.connectivity)
        }
    }
}
