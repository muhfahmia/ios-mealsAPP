//
//  MealsByCategoriesRepository.swift
//  Data
//
//  Created by Muhammad Fahmi on 14/12/23.
//

import Foundation
import Core
import Combine
import Domain

public struct MealsByCategoriesRepository<MealsByCategoriesDataSource: DataSource>: Repository where MealsByCategoriesDataSource.Request == String, MealsByCategoriesDataSource.Response == MealsResponse {
    
    public typealias Request = String
    public typealias Response = Meals
    
    private let dataSource: MealsByCategoriesDataSource
    
    public init(dataSource: MealsByCategoriesDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(request: String?) -> AnyPublisher<Meals, Error> {
        dataSource.execute(request: request).compactMap({ $0 })
            .eraseToAnyPublisher()
    }
}
