//
//  CoreInjection.swift
//  Core
//
//  Created by Muhammad Fahmi on 24/11/23.
//

import Domain
import Data

public protocol CoreInjection {
    func resolve() -> MealsDataSourceProtocol
    func resolve() -> MealsFavoriteDataSourceProtocol
    func resolve() -> MealsRepository
}


public extension CoreInjection where Self: Injection {
    func resolve() -> MealsDataSourceProtocol {
        return MealsDataSource()
    }
    
    func resolve() -> MealsFavoriteDataSourceProtocol {
        return MealsFavoriteDataSource()
    }
    
    func resolve() -> MealsRepository {
        return DefaultMealsRepository(mealsDataSource: resolve(), mealFavo: resolve())
    }
    
}
