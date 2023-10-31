//
//  APIError.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 24/10/23.
//

import Foundation

enum ApiError: Error {
    case unknown
    case connectionError
    case invalidJSONError
    case middlewareError(code: Int, message: String?)
    case failedMapping
    case invalidURL
}

extension ApiError {
  var localizedDescription: String {
    switch self {
    case .unknown:
      return "An error occurred. Please try again later."
    case .connectionError:
      return "Connection problem. Please check your internet connection."
    case .invalidJSONError:
      return "Service response in an unexpected format."
    case .middlewareError(_, let message):
      return message ?? ""
    case .failedMapping:
      return "Failed to read server's response."
    case.invalidURL:
        return "Invalid URL API"
    }
  }
}
