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

public struct MealCategoryDataSource: DataSource {
    public typealias Request = Any
    public typealias Response = CategoriesReponse
    
    public init() {}
    
    public func execute(request: Any?) -> AnyPublisher<CategoriesReponse, Never> {
        return APIManager.shared.requestData(url: MealsAPI.listCategories.endpoint, method: .get, responseType: CategoriesReponse.self)
    }
}

public struct MealsDataSource: DataSource {
    public typealias Request = String
    public typealias Response = MealsResponse
    
    public init() {}
    
    public func execute(request: String?) -> AnyPublisher<MealsResponse, Never> {
        return APIManager.shared.requestData(url: MealsAPI.listMeals(category: request ?? "").endpoint, method: .get, responseType: MealsResponse.self)
    }
}

public struct MealDetailDataSource: DataSource {
    public typealias Request = String
    public typealias Response = MealsResponse
    
    public init() {}
    
    public func execute(request: String?) -> AnyPublisher<MealsResponse, Never> {
        return APIManager.shared.requestData(url: MealsAPI.mealDetail(withID: id).endpoint, method: .get, responseType: MealsResponse.self)
    }
}
