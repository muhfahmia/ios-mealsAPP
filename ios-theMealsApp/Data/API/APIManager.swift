//
//  NetworkManager.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 24/10/23.
//

import Foundation
import Alamofire
import ObjectMapper
import Combine

class APIManager {
    static let shared = APIManager()

    private init() {}

    func requestData<T: Mappable>(
        url: String,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        responseType: T.Type
    ) -> AnyPublisher<T, Error> {
        return Future<T, Error> { promise in
            if let url = URL(string: url) {
                AF.request(url, method: method, parameters: parameters)
                .validate()
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        if let jsonString = String(data: data, encoding: .utf8),
                           let mapper = Mapper<T>().map(JSONString: jsonString) {
                            promise(.success(mapper))
                        } else {
                            promise(.failure(ApiError.failedMapping))
                        }
                    case .failure(let error):
                        promise(.failure(error))
                    }
                }
            } else {
                promise(.failure(ApiError.invalidURL))
            }
        }.eraseToAnyPublisher()
    }
}
