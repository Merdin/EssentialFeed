//
//  FeedImagePresenterTests.swift
//  EssentialFeedTests
//
//  Created by Merdin Kahrimanovic on 21-08-2023.
//

import XCTest
import EssentialFeed

class FeedImagePresenter {
	init(view: Any) {
		
	}
}

class FeedImagePresenterTests: XCTestCase {
	
	func test_init_doesNotSendMessagesToView() {
		let (_, view) = makeSUT()
		
		XCTAssertTrue(view.messages.isEmpty)
	}
	
	// MARK: Helpers
	
	private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedImagePresenter, view: ViewSpy) {
		let view = ViewSpy()
		let sut = FeedImagePresenter(view: view)
		trackForMemoryLeaks(view)
		trackForMemoryLeaks(sut)
		return (sut, view)
	}
	
	private class ViewSpy {
		let messages = [Any]()
	}
}
