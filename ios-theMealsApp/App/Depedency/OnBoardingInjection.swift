//
//  OnBoardingInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import UIKit

protocol OnBoardingInjection {
    func resolve() -> OnBoardingRouteCase
    func resolve() -> OnBoardingViewController
}

extension OnBoardingInjection where Self: Injection {
    
    func resolve() -> OnBoardingRouteCase {
        return OnBoardingRouter(injection: self)
    }
    
    func resolve() -> OnBoardingViewController {
        return OnBoardingViewController(router: resolve())
    }
}
