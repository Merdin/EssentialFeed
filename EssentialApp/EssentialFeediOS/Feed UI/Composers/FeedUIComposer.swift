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
		let refreshController = FeedRefreshViewController(feedLoader: feedLoader)
		let feedController = FeedViewController(refreshController: refreshController)
		refreshController.onRefresh = { [weak feedController] feed in
			feedController?.tableModel = feed.map { model in
				FeedImageCellController(model: model, imageLoader: imageLoader)
			}
		}
		return feedController
	}
}
