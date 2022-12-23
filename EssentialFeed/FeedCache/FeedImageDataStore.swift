//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 23/12/2022.
//

import Foundation

public protocol FeedImageDataStore {
    typealias Result = Swift.Result<Data?, Error>

    func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
