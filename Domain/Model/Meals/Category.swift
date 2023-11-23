//
//  Category.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation

public protocol Categories {
    var categories: [MCategory]? { get }
}

public protocol MCategory {
    var name: String? { get }
}
