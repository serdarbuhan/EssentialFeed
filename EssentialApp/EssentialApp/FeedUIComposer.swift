//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Serdar Buhan on 19/12/2022.
//

import UIKit
import Combine
import EssentialFeed
import EssentialFeediOS

public final class FeedUIComposer {
    private init() {}

    public static func feedComposedWith(feedLoader: @escaping () -> FeedLoader.Publisher, imageLoader: FeedImageDataLoader) -> FeedViewController {
        let presentationAdapter = FeedLoaderPresentationAdapter(feedLoader: { feedLoader().dispatchOnMainQueue() })

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
