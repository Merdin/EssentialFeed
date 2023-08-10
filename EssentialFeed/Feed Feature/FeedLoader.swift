//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Merdin Kahrimanovic on 03/07/2023.
//

import Foundation

public protocol FeedLoader {
	typealias Result = Swift.Result<[FeedImage], Error>
	
	func load(completion: @escaping (Result) -> Void)
}
