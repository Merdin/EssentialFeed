//
//  SharedTestHelpers.swift
//  EssentialFeedTests
//
//  Created by Merdin Kahrimanovic on 06-08-2023.
//

import Foundation

func anyURL() -> URL {
	return URL(string: "http://any-url.com")!
}

func anyNSError() -> NSError {
	return NSError(domain: "any error", code: 0)
}
