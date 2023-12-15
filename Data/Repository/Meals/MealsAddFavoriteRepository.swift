//
//  MealsAddFavoriteRepository.swift
//  Data
//
//  Created by Muhammad Fahmi on 15/12/23.
//

import Foundation
import Core
import Combine
import Domain

public struct MealsAddFavoriteRepository: Repository {
    
    public typealias Request = Meal
    public typealias Response = Bool
    
    private let dataSource: MealsFavoriteDataSource
    
    public init(dataSource: MealsFavoriteDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(request: Request?) -> AnyPublisher<Response, Error> {
        dataSource.add(entities: request!)
    }
}
