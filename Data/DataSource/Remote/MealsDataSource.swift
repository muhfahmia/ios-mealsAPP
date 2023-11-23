//
//  MealsDataSource.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import Combine
import Domain

public protocol MealsDataSourceProtocol {
    func getCategoriesFromSource() -> AnyPublisher<CategoriesReponse, Error>
    func getMealsFromSource(category: String) -> AnyPublisher<MealsResponse, Error>
    func getMealDetailFromSource(withID id: String) -> AnyPublisher<MealsResponse, Error>
}

public struct MealsDataSource: MealsDataSourceProtocol {
    
    public init() {}
    
    public func getCategoriesFromSource() -> AnyPublisher<CategoriesReponse, Error> {
        return APIManager.shared.requestData(url: MealsAPI.listCategories.endpoint, method: .get, responseType: CategoriesReponse.self)
    }
    
    public func getMealsFromSource(category: String) -> AnyPublisher<MealsResponse, Error> {
        return APIManager.shared.requestData(url: MealsAPI.listMeals(category: category).endpoint, method: .get, responseType: MealsResponse.self)
    }
    
    public func getMealDetailFromSource(withID id: String) -> AnyPublisher<MealsResponse, Error> {
        return APIManager.shared.requestData(url: MealsAPI.mealDetail(withID: id).endpoint, method: .get, responseType: MealsResponse.self)
    }
    
}
