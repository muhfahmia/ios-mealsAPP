//
//  DataSource.swift
//  Core
//
//  Created by Uwais Alqadri on 12/12/23.
//

import Foundation
import Combine

public protocol DataSource {
  associatedtype Request
  associatedtype Response

  func execute(request: Request?) -> AnyPublisher<Response, Never>
}
