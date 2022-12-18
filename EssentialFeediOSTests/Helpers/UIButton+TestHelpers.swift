//
//  UIButton+TestHelpers.swift
//  EssentialFeediOSTests
//
//  Created by Serdar Buhan on 18/12/2022.
//

import UIKit

extension UIButton {
    func simulateTap() {
        simulate(event: .touchUpInside)
    }
}
