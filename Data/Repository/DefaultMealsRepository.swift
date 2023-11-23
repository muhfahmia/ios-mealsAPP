//
//  MealsRepository.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import Combine
import Domain

public struct DefaultMealsRepository: MealsRepository {

    private let mealsFavoriteDataSource: MealsFavoriteDataSourceProtocol
    private let mealsDataSource: MealsDataSourceProtocol
    
    public init(mealsDataSource: MealsDataSourceProtocol, mealFavo: MealsFavoriteDataSourceProtocol) {
        self.mealsDataSource = mealsDataSource
        self.mealsFavoriteDataSource = mealFavo
    }
    
    public func getMeals(category: String) -> AnyPublisher<Meals, Error> {
        return mealsDataSource.getMealsFromSource(category: category)
            .map {
                $0.self
            }.eraseToAnyPublisher()
    }
    
    public func getCategories() -> AnyPublisher<Categories, Error> {
        return mealsDataSource.getCategoriesFromSource()
            .map {
                $0.self
            }.eraseToAnyPublisher()
    }
    
    public func getMealDetail(withID id: String) -> AnyPublisher<Meals, Error> {
        return mealsDataSource.getMealDetailFromSource(withID: id)
            .map {
                $0.self
            }.eraseToAnyPublisher()
    }
    
    public func getMealsFavorite() -> AnyPublisher<[Meal], Never> {
        return mealsFavoriteDataSource.getMeals()
    }
    
    public func getMealFavorite(withID id: String) -> AnyPublisher<Bool, Never> {
        return mealsFavoriteDataSource.getMealWithID(withID: id)
    }

    public func addMealFavorite(with meal: Meal) -> Just<Bool> {
        return mealsFavoriteDataSource.addMeal(with: meal)
    }
    
    public func deleteMealFavorite(with meal: Meal) -> Just<Bool> {
        return mealsFavoriteDataSource.deleteMeal(with: meal)
    }
    
}
