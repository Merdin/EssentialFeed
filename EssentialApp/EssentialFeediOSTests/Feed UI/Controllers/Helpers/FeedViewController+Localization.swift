//
//  FeedViewController+Localization.swift
//  EssentialFeediOSTests
//
//  Created by Merdin Kahrimanovic on 19-08-2023.
//

import Foundation
import XCTest
import EssentialFeediOS

extension FeedViewControllerTests {
	func localize(_ key: String, file: StaticString = #filePath, line: UInt = #line) -> String {
		let table = "Feed"
		let bundle = Bundle(for: FeedViewController.self)
		let value = bundle.localizedString(forKey: key, value: nil, table: table)
		if value == key {
			XCTFail("Missing localized string for key: \(key) in table: \(table)", file: file, line: line)
		}
		return value
	}
}
