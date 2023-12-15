//
//  MealsDetailFavoriteRepository.swift
//  Data
//
//  Created by Muhammad Fahmi on 15/12/23.
//

import Foundation
import Core
import Combine
import Domain

public struct MealsDetailFavoriteRepository: Repository {
    
    public typealias Request = String
    public typealias Response = Bool
    
    private let dataSource: MealsFavoriteDataSource
    
    public init(dataSource: MealsFavoriteDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(request: String?) -> AnyPublisher<Bool, Error> {
        dataSource.detail(id: request ?? "")
    }
   
}
