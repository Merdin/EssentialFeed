//
//  FeedLoaderPresentationAdapter.swift
//  EssentialFeediOS
//
//  Created by Merdin Kahrimanovic on 19-08-2023.
//

import Combine
import EssentialFeed
import EssentialFeediOS

final class LoadResourcePresentationAdapter<Resource, View: ResourceView> {
	private let loader: () -> AnyPublisher<Resource, Error>
	private var cancellable: Cancellable?
	var presenter: LoadResourcePresenter<Resource, View>?

	init(loader: @escaping () -> AnyPublisher<Resource, Error>) {
		self.loader = loader
	}

	func loadResource() {
		presenter?.didStartLoading()

		cancellable = loader()
			.dispatchOnMainQueue()
			.sink(
				receiveCompletion: { [weak self] completion in
					switch completion {
						case .finished: break

						case let .failure(error):
							self?.presenter?.didFinishLoading(with: error)
					}
				}, receiveValue: { [weak self] feed in
					self?.presenter?.didFinishLoading(with: feed)
				})
	}
}


extension LoadResourcePresentationAdapter: FeedViewControllerDelegate {
	func didRequestFeedRefresh() {
		self.loadResource()
	}
}


extension LoadResourcePresentationAdapter: FeedImageCellControllerDelegate {
	func didRequestImage() {
		loadResource()
	}

	func didCancelImageRequest() {
		cancellable?.cancel()
		cancellable = nil
	}
}
