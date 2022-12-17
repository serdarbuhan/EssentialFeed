//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 04/12/2022.
//

import Foundation

public protocol HTTPClient {

    typealias Result = Swift.Result<(Data, HTTPURLResponse), Error>

    /// The completion handle can be invoked in any thread.
    /// Clients are responsible to dispatch to appropriate threads, if needed.
    func get(from url: URL,
             completion: @escaping (Result) -> Void)
}
