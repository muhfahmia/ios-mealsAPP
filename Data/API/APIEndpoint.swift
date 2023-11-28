//
//  APIEndpoint.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 24/10/23.
//

import Foundation

let baseUrl = "https://themealdb.com/api/json/v1/1/"

enum MealsAPI {
    case listCategories
    case listMeals(category: String)
    case mealDetail(withID: String)
    
    var endpoint: String {
        switch self {
        case .listCategories:
          return "\(baseUrl)list.php?c=list"
        case .listMeals(let category):
          return "\(baseUrl)filter.php?c=\(category)"
        case .mealDetail(let id):
          return "\(baseUrl)lookup.php?i=\(id)"
        }
    }

}
