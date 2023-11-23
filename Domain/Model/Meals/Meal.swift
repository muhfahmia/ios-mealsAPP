//
//  Meal.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation

public protocol Meals {
    var meals: [Meal]? { get }
}

public protocol Meal {
    var idMeal: String? { get }
    var name: String? { get }
    var imageThumb: String? { get }
    var category: String? { get }
    var area: String? { get }
    var instruction: String? { get }
    var linkYoutube: String? { get }
    var tags: String? { get }
}
