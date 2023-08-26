//
//  RemoteImageCommentsFeedLoader.swift
//  EssentialFeed
//
//  Created by Merdin Kahrimanovic on 26-08-2023.
//

import Foundation

public typealias RemoteImageCommentsLoader = RemoteLoader<[ImageComment]>

public extension RemoteImageCommentsLoader {
	convenience init(url: URL, client: HTTPClient) {
		self.init(url: url, client: client, mapper: ImageCommentsMapper.map)
	}
}
