//
//  UIControl+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Serdar Buhan on 18/12/2022.
//

import Foundation

import UIKit

extension UIControl {
    func simulate(event: UIControl.Event) {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: event)?.forEach {
                (target as NSObject).perform(Selector($0))
            }
        }
    }
}
