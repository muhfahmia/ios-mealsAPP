//
//  MealsListFavoriteRepository.swift
//  Data
//
//  Created by Muhammad Fahmi on 15/12/23.
//

import Foundation
import Core
import Combine
import Domain

public struct MealsListFavoriteRepository<MealsFavoriteDataSource: LocalDataSource>: Repository where MealsFavoriteDataSource.Request == Meal, MealsFavoriteDataSource.Response == Meal {
    
    public typealias Request = Meal
    public typealias Response = [Meal]
    
    private let dataSource: MealsFavoriteDataSource
    
    public init(dataSource: MealsFavoriteDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(request: Request?) -> AnyPublisher<[Meal], Error> {
        dataSource.list(request: request)
    }
   
}
