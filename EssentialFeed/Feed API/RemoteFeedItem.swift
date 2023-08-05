//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Merdin Kahrimanovic on 05-08-2023.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}