//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Merdin Kahrimanovic on 14-08-2023.
//

import UIKit

extension UIButton {
	func simulateTap() {
		allTargets.forEach { target in
			actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach {
				(target as NSObject).perform(Selector($0))
			}
		}
	}
}
