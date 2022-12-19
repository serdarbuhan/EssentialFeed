//
//  FeedViewModel.swift
//  EssentialFeediOS
//
//  Created by Serdar Buhan on 19/12/2022.
//

import Foundation
import EssentialFeed

// Stateless version

// platform agnostic reusable component
final class FeedViewModel {

    typealias Observer<T> = (T) -> Void

    private let feedLoader: FeedLoader

    init(feedLoader: FeedLoader) {
        self.feedLoader = feedLoader
    }

    // No state is managed here
    var onLoadingStateChange: Observer<Bool>?
    var onFeedLoad: Observer<[FeedImage]>?

    func loadFeed() {
        onLoadingStateChange?(true)
        feedLoader.load() { [weak self] result in
            if let feed = try? result.get() {
                self?.onFeedLoad?(feed)
            }
            self?.onLoadingStateChange?(false)
         }
    }
}
