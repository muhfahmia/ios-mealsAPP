//
//  UIImage.swift
//  Core
//
//  Created by Muhammad Fahmi on 01/12/23.
//

import Foundation
import UIKit

public extension UIImage {
    
    convenience init?(nameOrSystemName: String, in bundle: Bundle? = Bundle.main, compatibleWith traitCollection: UITraitCollection? = nil) {
        self.init(named: nameOrSystemName, in: bundle, compatibleWith: traitCollection)
    }
    
}
