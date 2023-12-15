//
//  MealsCategoriesRepository.swift
//  Data
//
//  Created by Muhammad Fahmi on 15/12/23.
//

import Foundation
import Core
import Combine
import Domain

public struct MealsCategoriesRepository<MealsCategoriesDataSource: DataSource>: Repository where MealsCategoriesDataSource.Request == String, MealsCategoriesDataSource.Response == CategoriesReponse {
    
    public typealias Request = String
    public typealias Response = Categories
    
    private let dataSource: MealsCategoriesDataSource
    
    public init(dataSource: MealsCategoriesDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(request: String?) -> AnyPublisher<Categories, Error> {
        dataSource.execute(request: request).compactMap({ $0 })
            .eraseToAnyPublisher()
    }
    
}
