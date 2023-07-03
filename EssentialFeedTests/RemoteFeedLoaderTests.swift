//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Merdin Kahrimanovic on 03/07/2023.
//

import XCTest

class RemoteFeedLoader {
	
}

class HTTPClient {
	var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {
	
	func test_init_doesNotRequestDataFromURL() {
		let client = HTTPClient()
		_ = RemoteFeedLoader()
		
		XCTAssertNil(client.requestedURL)
	}
}
