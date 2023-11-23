//
//  CategoriesReponse.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import ObjectMapper
import Domain

public struct MealsResponse: Meals, Mappable  {
    
    public var mealsResult: [MealResponse]?
    public var meals: [Meal]? {
        mealsResult
    }
    
    public init?(map: Map) {
        mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        mealsResult <- map["meals"]
    }
    
}

public struct MealResponse: Meal, Mappable {
    
    public var idMeal: String?
    public var name: String?
    public var imageThumb: String?
    public var category: String?
    public var area: String?
    public var instruction: String?
    public var linkYoutube: String?
    public var tags: String?
    
    public init?(map: Map) {
        mapping(map: map)
    }
    
    public mutating func mapping(map: Map) {
        idMeal <- map["idMeal"]
        name <- map["strMeal"]
        imageThumb <- map["strMealThumb"]
        category <- map["strCategory"]
        area <- map["strArea"]
        instruction <- map["strInstructions"]
        linkYoutube <- map["strYoutube"]
        tags <- map["strTags"]
    }
}

