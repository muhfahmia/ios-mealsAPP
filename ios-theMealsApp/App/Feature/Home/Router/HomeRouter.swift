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
    var aboutVC: AboutViewController { get }
    func routeToHome(from vc: UIViewController)
    func routeToDetail(from vc: UIViewController, withID id: String)
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
    
    var aboutVC: AboutViewController {
        injection.resolve()
    }
    
    func routeToHome(from vc: UIViewController) {
        let homeTabBar: HomeTabBarController = injection.resolve()
        UIApplication.shared.windows.first?.rootViewController = homeTabBar
    }
    
    func routeToDetail(from vc: UIViewController, withID id: String) {
        let detailRouter: MealDetailRouteCase = injection.resolve()
        detailRouter.routeToDetail(from: vc, withID: id)
    }
}
