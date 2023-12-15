//
//  CoreInjection.swift
//  Core
//
//  Created by Muhammad Fahmi on 24/11/23.
//

import Data
import Domain

public protocol CoreInjection {
    func resolve() -> MealsByCategoriesDataSource
    func resolve() -> MealsCategoriesDataSource
    func resolve() -> MealsDetailDataSource
    
    func resolve() -> MealsByCategoriesRepository
    func resolve() -> MealsCategoriesRepository
    func resolve() -> MealsDetailRepository
    
    func resolve() -> MealsFavoriteDataSource
    
    func resolve() -> MealsAddFavoriteRepository
    func resolve() -> MealsDeleteFavoriteRepository
    func resolve() -> MealsDetailFavoriteRepository
    func resolve() -> MealsListFavoriteRepository
}

public extension CoreInjection {
    
    func resolve() -> MealsByCategoriesDataSource {
        MealsByCategoriesDataSource()
    }
    
    func resolve() -> MealsCategoriesDataSource {
        MealsCategoriesDataSource()
    }
    
    func resolve() -> MealsDetailDataSource {
        MealsDetailDataSource()
    }
    
    func resolve() -> MealsByCategoriesRepository {
        MealsByCategoriesRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsCategoriesRepository {
        MealsCategoriesRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsDetailRepository {
        MealsDetailRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsFavoriteDataSource {
        MealsFavoriteDataSource()
    }
    
    func resolve() -> MealsAddFavoriteRepository {
        MealsAddFavoriteRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsDeleteFavoriteRepository {
        MealsDeleteFavoriteRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsDetailFavoriteRepository {
        MealsDetailFavoriteRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsListFavoriteRepository {
        MealsListFavoriteRepository(dataSource: resolve())
    }
    
}
