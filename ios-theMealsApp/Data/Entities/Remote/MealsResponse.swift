//
//  CategoriesReponse.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import ObjectMapper

struct MealsResponse: Meals, Mappable  {
    
    var mealsResult: [MealResponse]?
    var meals: [Meal]? {
        mealsResult
    }
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        mealsResult <- map["meals"]
    }
    
}

struct MealResponse: Meal, Mappable {
    
    var idMeal: String?
    var name: String?
    var imageThumb: String?
    var category: String?
    var area: String?
    var instruction: String?
    var linkYoutube: String?
    var tags: String?
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
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

