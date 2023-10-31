//
//  Category.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation

protocol Categories {
    var categories: [MCategory]? { get }
}

protocol MCategory {
    var name: String? { get }
}
