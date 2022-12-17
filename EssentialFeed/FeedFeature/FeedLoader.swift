//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 02/12/2022.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>

    func load(completion: @escaping (Result) -> Void)
}
