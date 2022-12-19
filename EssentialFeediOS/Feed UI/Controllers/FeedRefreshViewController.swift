//
//  FeedRefreshViewController.swift
//  EssentialFeediOS
//
//  Created by Serdar Buhan on 18/12/2022.
//

import UIKit

// Controller does not manage any state. Just binds the view with the view model
final class FeedRefreshViewController: NSObject {
    private(set) lazy var view = binded(UIRefreshControl())

    private let viewModel: FeedViewModel

    init(viewModel: FeedViewModel) {
        self.viewModel = viewModel
    }

    @objc func refresh() {
        viewModel.loadFeed()
    }

    private func binded(_ view: UIRefreshControl) -> UIRefreshControl {
        // binds the view model with the view
        viewModel.onLoadingStateChange = { [weak view] isLoading in
            if isLoading {
                view?.beginRefreshing()
            } else {
                view?.endRefreshing()
            }
        }
        // binds the view with the view model
        view.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return view
    }
}
