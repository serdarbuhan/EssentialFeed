//
//  UITableView+Dequeueing.swift
//  EssentialFeediOS
//
//  Created by Serdar Buhan on 19/12/2022.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
