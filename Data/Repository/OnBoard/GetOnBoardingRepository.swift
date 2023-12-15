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

struct GetOnBoardingRepository: Repository {
    typealias Request = Any
    
    typealias Response = [BoardPage]
    
    private let dataSource: OnBoardDataSource
    
    public init(dataSource: OnBoardDataSource) {
        self.dataSource = dataSource
    }
    
    func execute(request: Request?) -> AnyPublisher<[BoardPage], Error> {
        return dataSource.execute(request: request)
    }
}
