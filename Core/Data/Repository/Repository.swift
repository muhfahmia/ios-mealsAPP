//
//  Repository.swift
//  Core
//
//  Created by Muhammad Fahmi on 14/12/23.
//

import Foundation
import Combine

public protocol Repository {
  associatedtype Request
  associatedtype Response
  
  func execute(request: Request?) -> AnyPublisher<Response, Error>
}
