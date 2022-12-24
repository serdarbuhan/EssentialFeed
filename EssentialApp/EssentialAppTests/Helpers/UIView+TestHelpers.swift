//
//  UIView+TestHelpers.swift
//  EssentialAppTests
//
//  Created by Serdar Buhan on 24/12/2022.
//

import UIKit

extension UIView {
    func enforceLayoutCycle() {
        layoutIfNeeded()
        RunLoop.current.run(until: Date())
    }
}
