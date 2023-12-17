//
//  DetailInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import Foundation
import Domain
import Data

public protocol DetailInjection {
    func resolve(withID id: String) -> MealDetailViewController
    func resolveRoute() -> MealDetailRouteCase
    func resolve() -> MealDetailViewModel
    
    func resolve() -> MealDetailInteractor
    func resolve() -> MealsAddFavoriteInteractor
    func resolve() -> MealsDeleteFavoriteInteractor
    func resolve() -> MealsDetailFavoriteInteractor
}

public extension DetailInjection where Self: Injection {
    
    func resolve(withID id: String) -> MealDetailViewController {
        return MealDetailViewController(viewModel: resolve(), withID: id)
    }
    
    func resolveRoute() -> MealDetailRouteCase {
        return MealDetailRouter(injection: self)
    }
    
    func resolve() -> MealDetailViewModel {
        return MealDetailViewModel(mealDetailUseCase: resolve(), addFavoriteUseCase: resolve(), deleteFavoriteUseCase: resolve(), detailFavoriteUseCase: resolve())
    }
    
    func resolve() -> MealDetailInteractor {
        return MealDetailInteractor(repository: resolve())
    }
    
    func resolve() -> MealsAddFavoriteInteractor {
        return MealsAddFavoriteInteractor(repository: resolve())
    }
    
    func resolve() -> MealsDeleteFavoriteInteractor {
        return MealsDeleteFavoriteInteractor(repository: resolve())
    }
    
    func resolve() -> MealsDetailFavoriteInteractor {
        return MealsDetailFavoriteInteractor(repository: resolve())
    }
    
}
