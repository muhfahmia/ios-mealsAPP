//
//  DetailInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import Foundation
import Domain
import Data

protocol DetailInjection {
    func resolve(withID id: String) -> MealDetailViewController
    func resolve() -> MealDetailRouteCase
    func resolve() -> MealDetailViewModel
    
    func resolve() -> MealDetailUseCase
}

extension DetailInjection where Self: Injection {
    
    func resolve(withID id: String) -> MealDetailViewController {
        return MealDetailViewController(viewModel: resolve(), withID: id)
    }
    
    func resolve() -> MealDetailRouteCase {
        return MealDetailRouter(injection: self)
    }
    
    func resolve() -> MealDetailViewModel {
        return MealDetailViewModel(detailUseCase: resolve(), favoUseCase: resolve())
    }
    
    func resolve() -> MealDetailUseCase {
        return MealDetailInteractor(mealRepo: resolve())
    }
    
}
