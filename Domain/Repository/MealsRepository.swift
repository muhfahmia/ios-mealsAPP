//
//  MealsRepository.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/11/23.
//

import Foundation
import Combine

public protocol MealsRepository {
    func getMeals(category: String) -> AnyPublisher<Meals, Error>
    func getCategories() -> AnyPublisher<Categories, Error>
    func getMealDetail(withID id: String) -> AnyPublisher<Meals, Error>
    
    func getMealFavorite(withID id: String) -> AnyPublisher<Bool, Never>
    func getMealsFavorite() -> AnyPublisher<[Meal], Never>
    func addMealFavorite(with meal: Meal) -> Just<Bool>
    func deleteMealFavorite(with meal: Meal) -> Just<Bool>
}
