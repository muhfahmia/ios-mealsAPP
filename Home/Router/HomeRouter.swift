//
//  HomRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import UIKit
import Core

class HomeRouter: HomeRouteCase {

    private let injection: Injection
    
     init(injection: Injection) {
        self.injection = injection
    }
    
     var homeVC: HomeViewController {
        injection.resolve()
    }
    
     var favVC: UIViewController {
//        injection.resolveFavoriteVC()
      UIViewController()
    }
    
     var aboutVC: UIViewController {
//        injection.resolveAboutVC()
      UIViewController()
    }
    
     func appRouteHome(window: UIWindow?) {
        let homeTabBar: HomeTabBarController = injection.resolve()
        window?.rootViewController = homeTabBar
        window?.makeKeyAndVisible()
    }
    
     func routeToHome(from vc: UIViewController) {
        let homeTabBar: HomeTabBarController = injection.resolve()
        UIApplication.shared.windows.first?.rootViewController = homeTabBar
    }
    
     func routeToDetail(from vc: UIViewController, withID id: String) {
      // need module launcher
//        let detailRouter: MealDetailRouteCase = injection.resolve()
//        detailRouter.routeToDetail(from: vc, withID: id)
    }
}
