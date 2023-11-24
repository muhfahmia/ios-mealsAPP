//
//  HomRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import UIKit
import Favorite
import Home
import About

public class HomeRouter: HomeRouteCase {

    private let injection: Injection
    
    public init(injection: Injection) {
        self.injection = injection
    }
    
    public var homeVC: HomeViewController {
        injection.resolve()
    }
    
    public var favVC: FavoriteViewController {
        injection.resolve()
    }
    
    public var aboutVC: AboutViewController {
        injection.resolve()
    }
    
    public func appRouteHome(window: UIWindow?) {
        let homeTabBar: HomeTabBarController = injection.resolve()
        window?.rootViewController = homeTabBar
        window?.makeKeyAndVisible()
    }
    
    public func routeToHome(from vc: UIViewController) {
        let homeTabBar: HomeTabBarController = injection.resolve()
        UIApplication.shared.windows.first?.rootViewController = homeTabBar
    }
    
    public func routeToDetail(from vc: UIViewController, withID id: String) {
        let detailRouter: MealDetailRouteCase = injection.resolve()
        detailRouter.routeToDetail(from: vc, withID: id)
    }
}
