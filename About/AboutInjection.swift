//
//  AboutInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 08/11/23.
//

//import Core

public protocol AboutInjection {
    func resolveAboutVC() -> AboutViewController
}

public extension AboutInjection where Self: Injection {
    
    func resolveAboutVC() -> AboutViewController {
        return AboutViewController()
    }
    
}
