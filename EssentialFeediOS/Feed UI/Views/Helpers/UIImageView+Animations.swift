//
//  UIImageView+Animations.swift
//  EssentialFeediOS
//
//  Created by Serdar Buhan on 19/12/2022.
//

import UIKit

extension UIImageView {
    func setImageAnimated(_ newImage: UIImage?) {
        image = newImage

        guard newImage != nil else { return }

        alpha = 0
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
}
