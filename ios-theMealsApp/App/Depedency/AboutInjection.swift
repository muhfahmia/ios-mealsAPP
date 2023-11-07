//
//  AboutInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 08/11/23.
//

import Foundation

protocol AboutInjection {
    func resolve() -> AboutViewController
}

extension AboutInjection where Self: Injection {
    
    func resolve() -> AboutViewController {
        return AboutViewController()
    }
    
}
