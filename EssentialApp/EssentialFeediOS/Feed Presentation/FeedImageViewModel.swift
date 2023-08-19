//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Merdin Kahrimanovic on 14-08-2023.
//

import Foundation
import EssentialFeed

struct FeedImageViewModel<Image> {
	let description: String?
	let location: String?
	let image: Image?
	let isLoading: Bool
	let shouldRetry: Bool
	
	var hasLocation: Bool {
		return location != nil
	}
}