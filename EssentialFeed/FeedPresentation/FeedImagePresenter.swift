//
//  FeedImagePresenter.swift
//  EssentialFeed
//
//  Created by Serdar Buhan on 23/12/2022.
//

import Foundation

public final class FeedImagePresenter {
    public static func map(_ image: FeedImage) -> FeedImageViewModel {
        FeedImageViewModel(description: image.description,
                           location: image.location)
    }
}
