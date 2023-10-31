//
//  HomRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import UIKit

protocol HomeRouteCase {
    var homeVC: HomeViewController { get }
    var favVC: FavoriteViewController { get }
    func routeToHome(from vc: UIViewController)
}

class HomeRouter: HomeRouteCase {

    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    var homeVC: HomeViewController {
        injection.resolve()
    }
    
    var favVC: FavoriteViewController {
        injection.resolve()
    }
    
    func routeToHome(from vc: UIViewController) {
        let homeTabBar: HomeTabBarController = injection.resolve()
        UIApplication.shared.windows.first?.rootViewController = homeTabBar
    }
}
