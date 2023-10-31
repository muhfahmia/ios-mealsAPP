//
//  HomeInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

protocol HomeInjection {
    func resolve() -> HomeViewController
    
    func resolve() -> HomeViewModel
    
    func resolve() -> HomeRouteCase
    func resolve() -> HomeTabBarController
    
    func resolve() -> MealsDataSourceProtocol
    func resolve() -> MealsRepositoryProtocol
    func resolve() -> HomeUseCase
}

extension HomeInjection where Self: Injection {
    
    func resolve() -> HomeViewController {
        return HomeViewController(homeViewModel: resolve())
    }
    
    func resolve() -> HomeRouteCase {
        return HomeRouter(injection: self)
    }
    
    func resolve() -> HomeTabBarController {
        return HomeTabBarController(router: resolve())
    }
    
    func resolve() -> HomeViewModel {
        return HomeViewModel(homeInteractor: resolve())
    }
    
    func resolve() -> MealsDataSourceProtocol {
        return MealsDataSource()
    }
    
    func resolve() -> MealsRepositoryProtocol {
        return MealsRepository(mealsDataSource: resolve())
    }
    
    func resolve() -> HomeUseCase {
        return HomeInteractor(mealsRepo: resolve())
    }
}
