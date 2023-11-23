//
//  HomeInteractor.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import Combine

public protocol HomeUseCase {
    func getCategories() -> AnyPublisher<Categories, Error>
    func getMeals(category: String) -> AnyPublisher<Meals, Error>
}

public class HomeInteractor: HomeUseCase {
    
    private let mealsRepo: MealsRepository
    
    public init(mealsRepo: MealsRepository) {
        self.mealsRepo = mealsRepo
    }
    
    public func getCategories() -> AnyPublisher<Categories, Error> {
        return mealsRepo.getCategories()
    }
    
    public func getMeals(category: String) -> AnyPublisher<Meals, Error> {
        return mealsRepo.getMeals(category: category)
    }
    
}
