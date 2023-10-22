//
//  OnBoardingRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import Foundation

protocol OnBoardingRouteCase {
    var alreadyUse: Bool { get }
    var onBoardingViewController: OnBoardingViewController { get }
}

class OnBoardingRouter: OnBoardingRouteCase {
    
    var alreadyUse: Bool = true
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    var onBoardingViewController: OnBoardingViewController {
        return injection.resolve()
    }
    
}
