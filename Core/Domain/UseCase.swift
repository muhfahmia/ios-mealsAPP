//
//  UseCase.swift
//  Core
//
//  Created by Muhammad Fahmi on 15/12/23.
//

import Foundation
import Combine

public protocol UseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
