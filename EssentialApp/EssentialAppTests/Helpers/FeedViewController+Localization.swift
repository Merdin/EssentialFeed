//
//  FeedViewController+Localization.swift
//  EssentialFeediOSTests
//
//  Created by Merdin Kahrimanovic on 19-08-2023.
//

import Foundation
import XCTest
import EssentialFeed

extension FeedUIIntegrationTests {

	private class DummyView: ResourceView {
		func display(_ viewModel: Any) {}
	}

	var loadError: String {
		LoadResourcePresenter<Any, DummyView>.loadError
	}

	var feedTitle: String {
		FeedPresenter.title
	}
}
