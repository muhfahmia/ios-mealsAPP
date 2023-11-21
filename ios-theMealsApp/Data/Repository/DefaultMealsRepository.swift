//
//  MealsRepository.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import Combine

struct DefaultMealsRepository: MealsRepository {

    private let mealsFavoriteDataSource: MealsFavoriteDataSourceProtocol
    private let mealsDataSource: MealsDataSourceProtocol
    
    init(mealsDataSource: MealsDataSourceProtocol, mealFavo: MealsFavoriteDataSourceProtocol) {
        self.mealsDataSource = mealsDataSource
        self.mealsFavoriteDataSource = mealFavo
    }
    
    func getMeals(category: String) -> AnyPublisher<MealsResponse, Error> {
        return mealsDataSource.getMealsFromSource(category: category)
    }
    
    func getCategories() -> AnyPublisher<CategoriesReponse, Error> {
        return mealsDataSource.getCategoriesFromSource()
    }
    
    func getMealDetail(withID id: String) -> AnyPublisher<MealsResponse, Error> {
        return mealsDataSource.getMealDetailFromSource(withID: id)
    }
    
    func getMealsFavorite() -> AnyPublisher<[Meal], Never> {
        return mealsFavoriteDataSource.getMeals()
    }
    
    func getMealFavorite(withID id: String) -> AnyPublisher<Bool, Never> {
        return mealsFavoriteDataSource.getMealWithID(withID: id)
    }

    func addMealFavorite(with meal: Meal) -> Just<Bool> {
        return mealsFavoriteDataSource.addMeal(with: meal)
    }
    
    func deleteMealFavorite(with meal: Meal) -> Just<Bool> {
        return mealsFavoriteDataSource.deleteMeal(with: meal)
    }
    
}
