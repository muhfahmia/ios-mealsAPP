//
//  OnBoardingRouteCase.swift
//  OnBoarding
//
//  Created by Muhammad Fahmi on 24/11/23.
//

import UIKit

public protocol OnBoardingRouteCase {
    func routeToHome(from vc: UIViewController)
    func appRoute(window: UIWindow?)
}
