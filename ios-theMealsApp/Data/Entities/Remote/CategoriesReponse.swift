//
//  CategoriesReponse.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import ObjectMapper

struct CategoriesReponse: Categories, Mappable {

    var _categoriesResult: [CategoryResponse]?
    var categories: [MCategory]? {
        _categoriesResult
    }
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        _categoriesResult <- map["meals"]
    }
    
}

struct CategoryResponse: MCategory, Mappable {
    
    var nameResult: String?
    var name: String? {
        nameResult
    }
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        nameResult <- map["strCategory"]
    }
}

