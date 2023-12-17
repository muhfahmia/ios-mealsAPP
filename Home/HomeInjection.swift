//
//  HomeInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import Domain
import CoreData

public protocol HomeInjection {
    func resolve() -> HomeViewController
    func resolve() -> HomeViewModel
    func resolve() -> HomeRouteCase
    func resolve() -> HomeTabBarController
    func resolve() -> MealsCategoriesInteractor
    func resolve() -> MealsByCategoriesInteractor
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
      return HomeViewModel(mealsByCategoriesInteractor: resolve(), mealCategoriesInteractor: resolve())
    }
    
    func resolve() -> MealsByCategoriesInteractor {
        return MealsByCategoriesInteractor(repository: resolve())
    }
    
    func resolve() -> MealsCategoriesInteractor {
        return MealsCategoriesInteractor(repository: resolve())
    }
}
