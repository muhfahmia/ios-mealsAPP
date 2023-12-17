//
//  FavoriteInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import Domain

public protocol FavoriteInjection {
    func resolveFavoriteVC() -> FavoriteViewController
    
    func resolveRouter() -> FavoriteRouteCase
    
    func resolve() -> FavoriteViewModel
    func resolve() -> MealsFavoriteInteractor
    func resolve() -> MealsDeleteFavoriteInteractor
}

public extension FavoriteInjection where Self: Injection {
    
    func resolveFavoriteVC() -> FavoriteViewController {
        return FavoriteViewController(viewModel: resolve(), router: resolveRouter())
    }
    
    func resolveRouter() -> FavoriteRouteCase {
        return FavoriteRouter(injection: self)
    }
    
    func resolve() -> FavoriteViewModel {
        return FavoriteViewModel(favListUseCase: resolve(), favDeleteUseCase: resolve())
    }
    
    func resolve() -> MealsFavoriteInteractor {
        return MealsFavoriteInteractor(repository: resolve())
    }
    
    func resolve() -> MealsDeleteFavoriteInteractor {
        return MealsDeleteFavoriteInteractor(repository: resolve())
    }
    
}
