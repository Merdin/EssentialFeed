//
//  ImageFeedLoaderWithFallbackCompositeTests.swift
//  EssentialAppTests
//
//  Created by Merdin Kahrimanovic on 23-08-2023.
//

import XCTest
import EssentialFeed

class ImageFeedLoaderWithFallbackComposite: FeedImageDataLoader {
	private class Task: FeedImageDataLoaderTask {
		func cancel() {

		}
	}

	init(primary: FeedImageDataLoader, fallback: FeedImageDataLoader) {}

	func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> EssentialFeed.FeedImageDataLoaderTask {
		return Task()
	}
}

final class ImageFeedLoaderWithFallbackCompositeTests: XCTestCase {

	func test_load_deliversPrimaryImageOnPrimaryLoaderSuccess() {
		let primaryLoader = LoaderSpy()
		let fallbackLoader = LoaderSpy()
		_ = ImageFeedLoaderWithFallbackComposite(primary: primaryLoader, fallback: fallbackLoader)

		XCTAssertTrue(primaryLoader.loadedURLs.isEmpty, "Expected no loaded URLs in the primary loader")
		XCTAssertTrue(fallbackLoader.loadedURLs.isEmpty, "Expected no loaded URLs in the fallback loader")
	}

	// MARK: Helpers

	private class LoaderSpy: FeedImageDataLoader {
		private var messages = [(url: URL, completion: (FeedImageDataLoader.Result) -> Void)]()

		var loadedURLs: [URL] {
			return messages.map { $0.url }
		}

		private struct Task: FeedImageDataLoaderTask {
			func cancel() {}
		}

		func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
			messages.append((url, completion))
			return Task()
		}
	}
}
