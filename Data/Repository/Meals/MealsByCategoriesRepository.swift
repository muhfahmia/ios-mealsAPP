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

public struct MealsByCategoriesRepository: Repository {
    
    public typealias Request = String
    public typealias Response = MealsResponse
    
    private let dataSource: MealsByCategoriesDataSource
    
    public init(dataSource: MealsByCategoriesDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(request: String?) -> AnyPublisher<Response, Error> {
        dataSource.execute(request: request)
    }
    
}
