//
//  UIButton.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 01/11/23.
//

import UIKit

public extension UIButton {
    
    private var states: [UIControl.State] {
        [.normal, .selected, .highlighted, .disabled, .focused]
    }
    
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        clipsToBounds = true // maintain corner radius

        let colorImage = UIGraphicsImageRenderer(size: CGSize(width: 1, height: 1)).image { context in
            color.setFill()
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            draw(.zero)
        }
        setBackgroundImage(colorImage, for: forState)
    }

}
