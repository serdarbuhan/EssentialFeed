//
//  FeedErrorViewModel.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 23/12/2022.
//

public struct FeedErrorViewModel {
    public let message: String?

    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
