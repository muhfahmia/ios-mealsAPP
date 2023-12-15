//
//  CoreInjection.swift
//  Core
//
//  Created by Muhammad Fahmi on 24/11/23.
//

import Data
import Domain
import Core

public protocol CoreInjection {
    func resolve() -> MealsByCategoriesDataSource
    func resolve() -> MealsCategoriesDataSource
    func resolve() -> MealsDetailDataSource
    
    func resolve() -> MealsByCategoriesRepository<MealsByCategoriesDataSource>
    func resolve() -> MealsCategoriesRepository<MealsCategoriesDataSource>
    func resolve() -> MealsDetailRepository<MealsDetailDataSource>
    
    func resolve() -> MealsFavoriteDataSource
    
    func resolve() -> MealsAddFavoriteRepository<MealsFavoriteDataSource>
    func resolve() -> MealsDeleteFavoriteRepository<MealsFavoriteDataSource>
    func resolve() -> MealsDetailFavoriteRepository<MealsFavoriteDataSource>
    func resolve() -> MealsListFavoriteRepository<MealsFavoriteDataSource>
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
    
    func resolve() -> MealsByCategoriesRepository<MealsByCategoriesDataSource> {
        MealsByCategoriesRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsCategoriesRepository<MealsCategoriesDataSource> {
        MealsCategoriesRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsDetailRepository<MealsDetailDataSource> {
        MealsDetailRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsFavoriteDataSource {
        MealsFavoriteDataSource()
    }
    
    func resolve() -> MealsAddFavoriteRepository<MealsFavoriteDataSource> {
        MealsAddFavoriteRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsDeleteFavoriteRepository<MealsFavoriteDataSource> {
        MealsDeleteFavoriteRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsDetailFavoriteRepository<MealsFavoriteDataSource> {
        MealsDetailFavoriteRepository(dataSource: resolve())
    }
    
    func resolve() -> MealsListFavoriteRepository<MealsFavoriteDataSource> {
        MealsListFavoriteRepository(dataSource: resolve())
    }
    
}
