//
//  UINavigationBar.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import UIKit

public extension UINavigationBar {
    
    func makeTransparent(withTint tint: UIColor = .white) {
        let legacyAppearance = { [self] in
            isTranslucent = true
            backgroundColor = .clear
            barTintColor = .clear
            setBackgroundImage(UIImage(), for: .default)
            titleTextAttributes = [.foregroundColor: tint]
            shadowImage = UIImage()
        }
        #if os(tvOS)
        legacyAppearance()
        #else
        if #available(iOS 13.0, *) {
            let imageConfig = UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 40, weight: .heavy), scale: .large)
            let imageBackIndicator = UIImage(systemName: "chevron.left.circle.fill", withConfiguration: imageConfig)
            let appearance = UINavigationBarAppearance()
            appearance.configureWithTransparentBackground()
            appearance.setBackIndicatorImage(imageBackIndicator, transitionMaskImage: imageBackIndicator)
            appearance.titleTextAttributes = [.foregroundColor: tint]
            standardAppearance = appearance
            scrollEdgeAppearance = appearance
            compactAppearance = appearance
        } else {
            legacyAppearance()
        }
        #endif
        tintColor = tint
    }
}
