//
//  LoadResourcePresenter.swift
//  EssentialFeed
//
//  Created by Merdin Kahrimanovic on 27-08-2023.
//

import Foundation

public protocol ResourceView {
	associatedtype ResourceViewModel

	func display(_ viewModel: ResourceViewModel)
}

public final class LoadResourcePresenter<Resource, View: ResourceView> {
	public typealias Mapper = (Resource) -> View.ResourceViewModel

	private let resourceView: View
	private let loadingView: FeedLoadingView
	private let errorView: FeedErrorView
	private let mapper: Mapper

	public init(resourceView: View, loadingView: FeedLoadingView, errorView: FeedErrorView, mapper: @escaping Mapper) {
		self.resourceView = resourceView
		self.loadingView = loadingView
		self.errorView = errorView
		self.mapper = mapper
	}

	private var feedLoadError: String {
		return NSLocalizedString(
			"GENERIC_CONNECTION_ERROR",
			tableName: "Feed",
			bundle: Bundle(for: FeedPresenter.self),
			comment: "Error message displayed when we can't load the image feed from the server"
		)
	}

	public func didStartLoading() {
		errorView.display(.noError)
		loadingView.display(FeedLoadingViewModel(isLoading: true))
	}

	public func didFinishLoading(with resource: Resource) {
		resourceView.display(mapper(resource))
		loadingView.display(FeedLoadingViewModel(isLoading: false))
	}

	public func didFinishLoading(with error: Error) {
		errorView.display(.error(message: feedLoadError))
		loadingView.display(FeedLoadingViewModel(isLoading: false))
	}
}