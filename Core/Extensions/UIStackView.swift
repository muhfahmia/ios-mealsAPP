//
//  UIStackView.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 30/10/23.
//

import UIKit

public extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
       for view in views {
           addArrangedSubview(view)
       }
    }
    /// SwifterSwift: Removes all views in stack’s array of arranged subviews.
    func removeArrangedSubviews() {
       for view in arrangedSubviews {
           removeArrangedSubview(view)
       }
    }
}
