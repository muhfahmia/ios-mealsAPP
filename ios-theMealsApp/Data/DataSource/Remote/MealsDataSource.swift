//
//  MealsDataSource.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import Combine

protocol MealsDataSourceProtocol {
    func getCategoriesFromSource() -> AnyPublisher<CategoriesReponse, Error>
    func getMealsFromSource(category: String) -> AnyPublisher<MealsResponse, Error>
    func getMealDetailFromSource(withID id: String) -> AnyPublisher<MealsResponse, Error>
}

struct MealsDataSource: MealsDataSourceProtocol {
    
    func getCategoriesFromSource() -> AnyPublisher<CategoriesReponse, Error> {
        return APIManager.shared.requestData(url: MealsAPI.listCategories.endpoint, method: .get, responseType: CategoriesReponse.self)
    }
    
    func getMealsFromSource(category: String) -> AnyPublisher<MealsResponse, Error> {
        return APIManager.shared.requestData(url: MealsAPI.listMeals(category: category).endpoint, method: .get, responseType: MealsResponse.self)
    }
    
    func getMealDetailFromSource(withID id: String) -> AnyPublisher<MealsResponse, Error> {
        return APIManager.shared.requestData(url: MealsAPI.mealDetail(withID: id).endpoint, method: .get, responseType: MealsResponse.self)
    }
    
}
