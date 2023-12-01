//
//  DetailInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import Foundation
import Domain

public protocol DetailInjection {
    func resolve(withID id: String) -> MealDetailViewController
    func resolveRoute() -> MealDetailRouteCase
    func resolve() -> MealDetailViewModel
    
    func resolve() -> MealDetailUseCase
    func resolve() -> FavoriteUseCase
}

public extension DetailInjection where Self: Injection {
    
    func resolve(withID id: String) -> MealDetailViewController {
        return MealDetailViewController(viewModel: resolve(), withID: id)
    }
    
    func resolveRoute() -> MealDetailRouteCase {
        return MealDetailRouter(injection: self)
    }
    
    func resolve() -> MealDetailViewModel {
        return MealDetailViewModel(detailUseCase: resolve(), favoUseCase: resolve())
    }
    
    func resolve() -> MealDetailUseCase {
        return MealDetailInteractor(mealRepo: resolve())
    }
  
  func resolve() -> FavoriteUseCase {
    return FavoriteInteractor(mealsRepo: resolve())
  }
    
}
