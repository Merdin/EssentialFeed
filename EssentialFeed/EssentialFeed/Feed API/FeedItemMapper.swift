//
//  FeedItemMapper.swift
//  EssentialFeed
//
//  Created by Merdin Kahrimanovic on 08/07/2023.
//

import Foundation

final class FeedItemsMapper {
	private struct Root: Decodable {
		let items: [RemoteFeedItem]
	}
	
	private static var OK_200: Int { return 200 }
	
	static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
		guard response.isOK, let root = try? JSONDecoder().decode(Root.self, from: data) else {
			throw RemoteFeedLoader.Error.invalidData
		}
		
        return root.items
	}
}
