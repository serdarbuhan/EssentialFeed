//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Serdar Buhan on 19/12/2022.
//

import UIKit
import EssentialFeed

public final class FeedUIComposer {
    private init() {}

    public static func feedComposedWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {

        let mainThreadFeedLoader = MainQueueDispatchDecorator(decoratee: feedLoader)
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: mainThreadFeedLoader)

        let feedController = makeFeedViewController(delegate: presentationAdapter, title: FeedPresenter.title)

        let mainThreadImageDataLoader = MainQueueDispatchDecorator(decoratee: imageLoader)
        presentationAdapter.presenter = FeedPresenter(feedView: FeedViewAdapter(controller: feedController,
                                                                                imageLoader: mainThreadImageDataLoader),
                                                      loadingView: WeakRefVirtualProxy(feedController),
                                                      errorView: WeakRefVirtualProxy(feedController))
        return feedController
    }

    private static func makeFeedViewController(delegate: FeedViewControllerDelegate, title: String) -> FeedViewController {
        let bundle = Bundle(for: FeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! FeedViewController
        feedController.delegate = delegate
        feedController.title = FeedPresenter.title
        return feedController
    }
}
