//
//  UIRefreshControl+Helpers.swift
//  EssentialFeediOS
//
//  Created by Serdar Buhan on 22/12/2022.
//

import UIKit

extension UIRefreshControl {
    func update(isRefreshing: Bool) {
        isRefreshing ? beginRefreshing() : endRefreshing()
    }
}
