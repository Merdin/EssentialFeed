//
//  FeedItem.swift
//  EssentialFeed
//
//  Created by Merdin Kahrimanovic on 03/07/2023.
//

import Foundation

public struct FeedItem: Equatable {
	let id: UUID
	let description: String?
	let location: String?
	let imageURL: URL
}

