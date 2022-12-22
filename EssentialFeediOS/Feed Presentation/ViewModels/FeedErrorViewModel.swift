//
//  FeedErrorViewModel.swift
//  EssentialFeediOS
//
//  Created by Serdar Buhan on 22/12/2022.
//

struct FeedErrorViewModel {
    let message: String?

    static var noError: FeedErrorViewModel {
        return FeedErrorViewModel(message: nil)
    }

    static func error(message: String) -> FeedErrorViewModel {
        return FeedErrorViewModel(message: message)
    }
}
