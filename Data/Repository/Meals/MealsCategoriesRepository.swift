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

public struct MealsCategoriesRepository: Repository {
    
    public typealias Request = String
    public typealias Response = CategoriesReponse
    
    private let dataSource: MealsCategoriesDataSource
    
    public init(dataSource: MealsCategoriesDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(request: String?) -> AnyPublisher<Response, Error> {
        dataSource.execute(request: request)
    }
    
}
