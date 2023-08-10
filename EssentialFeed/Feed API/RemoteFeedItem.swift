//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Merdin Kahrimanovic on 05-08-2023.
//

import Foundation

struct RemoteFeedItem: Decodable {
    let id: UUID
    let description: String?
    let location: String?
    let image: URL
}
