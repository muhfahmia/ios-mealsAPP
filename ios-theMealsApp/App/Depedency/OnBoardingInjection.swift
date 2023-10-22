//
//  OnBoardingInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import Foundation

protocol OnBoardingInjection {
    func resolve() -> OnBoardingViewController
}

extension OnBoardingInjection where Self: Injection {
    
    func resolve() -> OnBoardingViewController {
        return OnBoardingViewController()
    }
    
}
