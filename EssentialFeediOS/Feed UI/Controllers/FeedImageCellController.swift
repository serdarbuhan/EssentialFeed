//
//  FeedImageCellController.swift
//  EssentialFeediOS
//
//  Created by Serdar Buhan on 19/12/2022.
//

import UIKit
import EssentialFeed

public protocol FeedImageCellControllerDelegate {
    func didRequestImage()
    func didCancelImageRequest()
}

public final class FeedImageCellController: CellController, ResourceView, ResourceLoadingView, ResourceErrorView {

    public typealias ResourceViewModel = UIImage

    private let viewModel: FeedImageViewModel
    private let delegate: FeedImageCellControllerDelegate
    private var cell: FeedImageCell?

    public init(viewModel: FeedImageViewModel, delegate: FeedImageCellControllerDelegate) {
        self.delegate = delegate
        self.viewModel = viewModel
    }

    public func view(in tableView: UITableView) -> UITableViewCell {
        cell = tableView.dequeueReusableCell()
        cell?.locationContainer.isHidden = !viewModel.hasLocation
        cell?.locationLabel.text = viewModel.location
        cell?.descriptionLabel.text = viewModel.description
        cell?.onRetry = delegate.didRequestImage
        delegate.didRequestImage()
        return cell!
    }

    public func preload() {
        delegate.didRequestImage()
    }

    public func cancelLoad() {
        releaseCellForReuse()
        delegate.didCancelImageRequest()
    }

    public func display(_ viewModel: UIImage) {
        cell?.feedImageView.setImageAnimated(viewModel)
    }

    public func display(_ viewModel: ResourceLoadingViewModel) {
        cell?.feedImageContainer.isShimmering = viewModel.isLoading
    }

    public func display(_ viewModel: ResourceErrorViewModel) {
        cell?.feedImageRetryButton.isHidden = viewModel.message == nil
    }

    private func releaseCellForReuse() {
        cell = nil
    }
}
