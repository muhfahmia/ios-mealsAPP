//
//  MealsRepository.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import Combine

protocol MealsRepositoryProtocol {
    func getMeals(category: String) -> AnyPublisher<MealsResponse, Error>
    func getCategories() -> AnyPublisher<CategoriesReponse, Error>
}

struct MealsRepository: MealsRepositoryProtocol {

    private let mealsDataSource: MealsDataSourceProtocol
    
    init(mealsDataSource: MealsDataSourceProtocol) {
        self.mealsDataSource = mealsDataSource
    }
    
    func getMeals(category: String) -> AnyPublisher<MealsResponse, Error> {
        return mealsDataSource.getMealsFromSource(category: category)
    }
    
    func getCategories() -> AnyPublisher<CategoriesReponse, Error> {
        return mealsDataSource.getCategoriesFromSource()
    }
    
}
