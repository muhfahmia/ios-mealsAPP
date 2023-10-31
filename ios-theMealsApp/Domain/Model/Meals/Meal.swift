//
//  Meal.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation

protocol Meals {
    var meals: [Meal]? { get }
}

protocol Meal {
    var idMeal: String? { get }
    var name: String? { get }
    var imageThumb: String? { get }
}
