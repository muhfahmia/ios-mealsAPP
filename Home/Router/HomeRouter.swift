//
//  HomRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import UIKit
import Core
import Favorite
import About
import Detail

class HomeRouter: HomeRouteCase {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    var homeVC: HomeViewController {
        injection.resolve()
    }
    
    var favVC: UIViewController {
        let favInjection = Favorite.ModuleInjection()
        return favInjection.resolveFavoriteVC()
    }
    
    var aboutVC: UIViewController {
        let aboutInjection = About.ModuleInjection()
        return aboutInjection.resolveAboutVC()
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
        let detailInjection = Detail.ModuleInjection()
        let detailRouter = detailInjection.resolveRoute()
        detailRouter.routeToDetail(from: vc, withID: id)
    }
}
