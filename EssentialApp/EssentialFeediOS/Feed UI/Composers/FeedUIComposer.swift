//
//  FeedUIComposer.swift
//  EssentialFeediOS
//
//  Created by Merdin Kahrimanovic on 14-08-2023.
//

import UIKit
import EssentialFeed

public final class FeedUIComposer {
	private init() {}
	
	public static func feedComposerdWith(feedLoader: FeedLoader, imageLoader: FeedImageDataLoader) -> FeedViewController {
		let feedViewModel = FeedViewModel(feedLoader: feedLoader)
		let refreshController = FeedRefreshViewController(viewModel: feedViewModel)
		let feedController = FeedViewController(refreshController: refreshController)
		feedViewModel.onFeedLoad = adaptFeedToCellControllers(forwardingTo: feedController, loader: imageLoader)
		return feedController
	}
	
	private static func adaptFeedToCellControllers(forwardingTo controller: FeedViewController, loader: FeedImageDataLoader) -> ([FeedImage]) -> Void {
		return { [weak controller] feed in
			controller?.tableModel = feed.map { model in
				FeedImageCellController(viewModel: FeedImageViewModel(model: model, imageLoader: loader, imageTransformer: UIImage.init))
			}
		}
	}
}
