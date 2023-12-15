//
//  Interactor.swift
//  Core
//
//  Created by Uwais Alqadri on 15/12/23.
//

import Foundation
import Combine

public struct Interactor<Request, Response, R: Repository>: UseCase
where R.Request == Request, R.Response == Response {
    
    private let repository: R
    
    public init(repository: R) {
        self.repository = repository
    }
    
    public func execute(request: Request?) -> AnyPublisher<Response, Error> {
        repository.execute(request: request)
    }
}
