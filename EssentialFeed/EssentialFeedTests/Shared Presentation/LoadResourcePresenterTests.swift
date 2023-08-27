//
//  LoadResourcePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Merdin Kahrimanovic on 27-08-2023.
//

import XCTest
import EssentialFeed

class LoadResourcePresenterTests: XCTestCase {

	func test_title_isLocalized() {
		XCTAssertEqual(LoadResourcePresenter.title, localized("FEED_VIEW_TITLE"))
	}

	func test_init_doesNotSendMessagesToView() {
		let (_, view) = makeSUT()

		XCTAssertTrue(view.messages.isEmpty, "Expected no view messages")
	}

	func test_didStartLoadingFeed_displaysNoErrorMessageAndStartsLoading() {
		let (sut, view) = makeSUT()

		sut.didStartLoadingFeed()

		XCTAssertEqual(view.messages, [
			.display(errorMessage: .none),
			.display(isLoading: true)
		])
	}

	func test_didFinishLoadingFeed_displaysFeedAndStopsLoading() {
		let (sut, view) = makeSUT()
		let feed = uniqueImageFeed().models

		sut.didFinishLoadingFeed(with: feed)

		XCTAssertEqual(view.messages, [
			.display(feed: feed),
			.display(isLoading: false)
		])
	}

	func test_didFinishLoadingFeed_displaysLocalizedErrorMessageAndStopsLoading() {
		let (sut, view) = makeSUT()

		sut.didFinishLoadingFeed(with: anyNSError())

		XCTAssertEqual(view.messages, [
			.display(errorMessage: localized("FEED_VIEW_CONNECTION_ERROR")),
			.display(isLoading: false)
		])
	}

	// MARK: Helpers

	private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: LoadResourcePresenter, view: ViewSpy) {
		let view = ViewSpy()
		let sut = LoadResourcePresenter(feedView: view, loadingView: view, errorView: view)
		trackForMemoryLeaks(view)
		trackForMemoryLeaks(sut)
		return (sut, view)
	}

	func localized(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
		let table = "Feed"
		let bundle = Bundle(for: LoadResourcePresenter.self)
		let value = bundle.localizedString(forKey: key, value: nil, table: table)
		if value == key {
			XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
		}
		return value
	}

	private class ViewSpy: FeedView, FeedLoadingView, FeedErrorView {
		enum Message: Hashable {
			case display(feed: [FeedImage])
			case display(isLoading: Bool)
			case display(errorMessage: String?)
		}

		private(set) var messages = Set<Message>()

		func display(_ viewModel: FeedViewModel) {
			messages.insert(.display(feed: viewModel.feed))
		}

		func display(_ viewModel: FeedLoadingViewModel) {
			messages.insert(.display(isLoading: viewModel.isLoading))
		}

		func display(_ viewModel: FeedErrorViewModel) {
			messages.insert(.display(errorMessage: viewModel.message))
		}
	}
}
