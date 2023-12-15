//
//  MealsDataSource.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import Combine
import Domain
import Core

public struct MealsCategoriesDataSource: DataSource {
    public typealias Request = Any
    public typealias Response = CategoriesReponse
    
    public init() {}
    
    public func execute(request: Any?) -> AnyPublisher<CategoriesReponse, Error> {
        return APIManager.shared.requestData(url: MealsAPI.listCategories.endpoint, method: .get, responseType: CategoriesReponse.self)
    }
}

public struct MealsByCategoriesDataSource: DataSource {
    public typealias Request = String
    public typealias Response = MealsResponse
    
    public init() {}
    
    public func execute(request: String?) -> AnyPublisher<MealsResponse, Error> {
        return APIManager.shared.requestData(url: MealsAPI.listMeals(category: request ?? "").endpoint, method: .get, responseType: MealsResponse.self)
    }
}

public struct MealsDetailDataSource: DataSource {
    public typealias Request = String
    public typealias Response = MealsResponse
    
    public init() {}
    
    public func execute(request: String?) -> AnyPublisher<MealsResponse, Error> {
        return APIManager.shared.requestData(url: MealsAPI.mealDetail(withID: request ?? "").endpoint, method: .get, responseType: MealsResponse.self)
    }
}
