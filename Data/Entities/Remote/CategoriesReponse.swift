//
//  CategoriesReponse.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import ObjectMapper
import Domain

public struct CategoriesReponse: Categories, Mappable {

    public var _categoriesResult: [CategoryResponse]?
    public var categories: [MCategory]? {
        _categoriesResult
    }
    
    public init?(map: Map) {
        mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        _categoriesResult <- map["meals"]
    }
    
}

public struct CategoryResponse: MCategory, Mappable {
    
    public var nameResult: String?
    public var name: String? {
        nameResult
    }
    
    public init?(map: Map) {
        mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        nameResult <- map["strCategory"]
    }
}

