//
//  MealsFavoriteDataSource.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 06/11/23.
//

import CoreData

protocol MealsFavoriteDataSourceProtocol {
    func add(with meal: Meal, completion: @escaping (Int) -> Void)
}

class MealsFavoriteDataSource: MealsFavoriteDataSourceProtocol {
    private let context: NSManagedObjectContext
    private let gameEntity: NSEntityDescription
    
    init(context: NSManagedObjectContext, gameEntity: NSEntityDescription) {
        self.context = context
        self.gameEntity = gameEntity
    }
    
    func add(with meal: Meal, completion: @escaping (Int) -> Void) {
        
    }
    
}
