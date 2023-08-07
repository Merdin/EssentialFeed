//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by Merdin Kahrimanovic on 08/07/2023.
//

import Foundation

public enum HTTPClientResult {
	case success(Data, HTTPURLResponse)
	case failure(Error)
}

public protocol HTTPClient {
	/// The completion handler can be invoked in any thread.
	/// Clients are responsible to dispatch to appropriate thread, if needed.
	func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
