//
//  APIEndpoint.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 24/10/23.
//

import Foundation

enum MealsAPI {
    static let baseUrl = "https://themealdb.com/api/json/v1/1/"
    case listCategories
    case listMeals(category: String)
    case mealDetail(withID: String)
    
    var endpoint: String {
        switch self {
        case .listCategories: "\(MealsAPI.baseUrl)list.php?c=list"
        case .listMeals(let category): "\(MealsAPI.baseUrl)filter.php?c=\(category)"
        case .mealDetail(let id): "\(MealsAPI.baseUrl)lookup.php?i=\(id)"
        }
    }

}
