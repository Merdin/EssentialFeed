//
//  FeedImageDataStore.swift
//  EssentialFeed
//
//  Created by Merdin Kahrimanovic on 21-08-2023.
//

import Foundation

public protocol FeedImageDataStore {
	typealias Result = Swift.Result<Data?, Error>

	func retrieve(dataForURL url: URL, completion: @escaping (Result) -> Void)
}
