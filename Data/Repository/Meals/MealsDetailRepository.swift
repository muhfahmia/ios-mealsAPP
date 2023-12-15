//
//  MealsDetailRepository.swift
//  Data
//
//  Created by Muhammad Fahmi on 15/12/23.
//

import Foundation
import Core
import Combine
import Domain

public struct MealsDetailRepository<MealsDetailDataSource: DataSource>: Repository where MealsDetailDataSource.Request == String, MealsDetailDataSource.Response == MealsResponse {
    
    public typealias Request = String
    public typealias Response = Meals
    
    private let dataSource: MealsDetailDataSource
    
    public init(dataSource: MealsDetailDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(request: String?) -> AnyPublisher<Meals, Error> {
        dataSource.execute(request: request).compactMap({ $0 })
            .eraseToAnyPublisher()
    }
    
}
