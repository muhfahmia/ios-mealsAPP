//
//  HomeInteractor.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import Combine

protocol HomeUseCase {
    func getCategories() -> AnyPublisher<CategoriesReponse, Error>
    func getMeals(category: String) -> AnyPublisher<MealsResponse, Error>
}

class HomeInteractor: HomeUseCase {
    
    private let mealsRepo: MealsRepository
    
    init(mealsRepo: MealsRepository) {
        self.mealsRepo = mealsRepo
    }
    
    func getCategories() -> AnyPublisher<CategoriesReponse, Error> {
        return mealsRepo.getCategories()
    }
    
    func getMeals(category: String) -> AnyPublisher<MealsResponse, Error> {
        return mealsRepo.getMeals(category: category)
    }
    
}
