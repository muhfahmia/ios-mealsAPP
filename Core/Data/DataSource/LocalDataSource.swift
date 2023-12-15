//
//  LocalDataSource.swift
//  Core
//
//  Created by Muhammad Fahmi on 12/12/23.
//

import Foundation
import Combine

public protocol LocalDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?) -> AnyPublisher<[Response], Error>
    func add(entities: Request) -> AnyPublisher<Bool, Error>
    func detail(id: String) -> AnyPublisher<Bool, Error>
    func delete(entity: Response) -> AnyPublisher<Bool, Error>
}
