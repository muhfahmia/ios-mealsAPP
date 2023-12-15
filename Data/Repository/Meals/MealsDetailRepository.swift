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

public struct MealsDetailRepository: Repository {
    
    public typealias Request = String
    public typealias Response = MealsResponse
    
    private let dataSource: MealsDetailDataSource
    
    public init(dataSource: MealsDetailDataSource) {
        self.dataSource = dataSource
    }
    
    public func execute(request: String?) -> AnyPublisher<Response, Error> {
        dataSource.execute(request: request)
    }
    
}
