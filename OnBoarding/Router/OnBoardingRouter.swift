//
//  OnBoardingRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import Foundation
import UIKit
//import Core

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
//        let homeRouter: HomeRouteCase = injection.resolve()
//        homeRouter.routeToHome(from: vc)
    }
    
}
