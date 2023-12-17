//
//  OnBoardingRepository.swift
//  Data
//
//  Created by Muhammad Fahmi on 15/12/23.
//

import Foundation
import Combine
import Core
import Domain

public struct GetOnBoardingRepository<R: DataSource>: Repository where R.Request == Any, R.Response == [BoardPage] {
    public typealias Request = Any
    
    public typealias Response = [BoardPage]
    
    private let dataSource: R
    
    public init(dataSource: R) {
        self.dataSource = dataSource
    }
    
    public func execute(request: Request?) -> AnyPublisher<[BoardPage], Error> {
        return dataSource.execute(request: request)
    }
}
