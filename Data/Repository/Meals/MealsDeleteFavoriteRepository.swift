//
//  MealsDeleteFavoriteRepository.swift
//  Data
//
//  Created by Muhammad Fahmi on 15/12/23.
//

import Foundation
import Combine
import Domain
import Core

public struct MealsDeleteFavoriteRepository: Repository {
    public typealias Request = Meal
    
    public typealias Response = Bool
    
    private let dataSource: MealsFavoriteDataSource
    
    public init(dataSource: MealsFavoriteDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(request: Request?) -> AnyPublisher<Bool, Error> {
        dataSource.delete(entity: request!)
    }
    
    
}
