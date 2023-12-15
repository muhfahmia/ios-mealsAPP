//
//  ApiError.swift
//  Domain
//
//  Created by Muhammad Fahmi on 14/12/23.
//

import Foundation

public enum ApiError: Error {
    case unknown
    case connectionError
    case invalidJSONError
    case middlewareError(code: Int, message: String?)
    case failedMapping
    case invalidURL
}
