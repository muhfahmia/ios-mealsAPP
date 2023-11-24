//
//  HomeInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import Home
import Domain
import CoreData

public protocol HomeInjection {
    func resolve() -> HomeViewController
    func resolve() -> HomeViewModel
    func resolve() -> HomeRouteCase
    func resolve() -> HomeTabBarController
    func resolve() -> HomeUseCase
}

public extension HomeInjection where Self: Injection {
    
    func resolve() -> HomeTabBarController {
        return HomeTabBarController(router: resolve())
    }
    
    func resolve() -> HomeViewController {
        return HomeViewController(homeViewModel: resolve(), router: resolve())
    }
    
    func resolve() -> HomeRouteCase {
        return HomeRouter(injection: self)
    }
    
    func resolve() -> HomeViewModel {
        return HomeViewModel(homeInteractor: resolve())
    }
    
    func resolve() -> HomeUseCase {
        return HomeInteractor(mealsRepo: resolve())
    }
}
