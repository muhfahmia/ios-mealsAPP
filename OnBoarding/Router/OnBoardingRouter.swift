//
//  OnBoardingRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import Foundation
import UIKit
import Common
import Home

public protocol OnBoardingRouteCase {
    func routeToHome(from vc: UIViewController)
    func appRoute(window: UIWindow?)
}

public class OnBoardingRouter: OnBoardingRouteCase {
    
    private let injection: Injection
    
    public init(injection: Injection) {
        self.injection = injection
    }
    
    public func appRoute(window: UIWindow?) {
        let onboardVC: OnBoardingViewController = injection.resolve()
        window?.rootViewController = onboardVC
        window?.makeKeyAndVisible()
    }
    
    public func routeToHome(from vc: UIViewController) {
        let homeInjection = Home.ModuleInjection()
        let homeRouter: HomeRouteCase = homeInjection.resolve()
        homeRouter.routeToHome(from: vc)
    }
    
}
