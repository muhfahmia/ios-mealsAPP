//
//  CoreInjection.swift
//  Core
//
//  Created by Muhammad Fahmi on 24/11/23.
//

import Data
import Domain

public protocol CoreInjection {
    func resolve() -> MealsDataSourceProtocol
    func resolve() -> MealsFavoriteDataSourceProtocol
    func resolve() -> MealsRepository
}

public extension CoreInjection {
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
