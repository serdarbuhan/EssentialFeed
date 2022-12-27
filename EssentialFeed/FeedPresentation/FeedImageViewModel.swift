//
//  FeedImageViewModel.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 23/12/2022.
//

public struct FeedImageViewModel {
    public let description: String?
    public let location: String?

    public var hasLocation: Bool {
        return location != nil
    }
}
