//
//  AboutInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 08/11/23.
//

import About

public protocol AboutInjection {
    func resolve() -> AboutViewController
}

public extension AboutInjection where Self: Injection {
    
    func resolve() -> AboutViewController {
        return AboutViewController()
    }
    
}
