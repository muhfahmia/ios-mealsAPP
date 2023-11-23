//
//  OnBoardingRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import Foundation
import UIKit

protocol OnBoardingRouteCase {
    func routeToHome(from vc: UIViewController)
    func appRoute(window: UIWindow?)
}

class OnBoardingRouter: OnBoardingRouteCase {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    func appRoute(window: UIWindow?) {
        let onboardVC: OnBoardingViewController = injection.resolve()
        window?.rootViewController = onboardVC
        window?.makeKeyAndVisible()
    }
    
    func routeToHome(from vc: UIViewController) {
        let homeRouter: HomeRouteCase = injection.resolve()
        homeRouter.routeToHome(from: vc)
    }
    
}
