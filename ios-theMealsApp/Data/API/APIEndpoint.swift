//
//  APIEndpoint.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 24/10/23.
//

import Foundation

enum MealsAPI {
    
    case listCategories
    case listMeals(category: String)
    
    var endpoint: String {
        switch self {
        case .listCategories: "\(Constants.baseUrl)list.php?c=list"
        case .listMeals(let category): "\(Constants.baseUrl)filter.php?c=\(category)"
        }
    }

}
