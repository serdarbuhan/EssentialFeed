//
//  ResourceErrorViewModel.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 23/12/2022.
//

public struct ResourceErrorViewModel {
    public let message: String?

    static var noError: ResourceErrorViewModel {
        return ResourceErrorViewModel(message: nil)
    }

    static func error(message: String) -> ResourceErrorViewModel {
        return ResourceErrorViewModel(message: message)
    }
}
