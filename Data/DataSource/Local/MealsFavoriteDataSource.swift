//
//  MealsFavoriteDataSource.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 06/11/23.
//

import Combine
import Domain
import CoreData

public protocol MealsFavoriteDataSourceProtocol {
    func deleteMeal(with meal: Meal) -> Just<Bool>
    func addMeal(with meal: Meal) -> Just<Bool>
    func getMeals() -> AnyPublisher<[Meal], Never>
    func getMealWithID(withID id: String) -> AnyPublisher<Bool, Never>
}

public class MealsFavoriteDataSource: MealsFavoriteDataSourceProtocol {
    
    lazy var container: NSPersistentContainer = {
        let messageKitBundle = Bundle(identifier: "mfa.Data")
        let modelURL = messageKitBundle!.url(forResource: "CoreDataMeal", withExtension: "momd")!
        let managedObjectModel =  NSManagedObjectModel(contentsOf: modelURL)
        let container = NSPersistentContainer(name: "CoreDataMeal", managedObjectModel: managedObjectModel!)
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error.localizedDescription)")
            }
        })
        return container
    }()
    var context: NSManagedObjectContext {
        return self.container.viewContext
    }

    public init() {}
    
    public func addMeal(with meal: Meal) -> Just<Bool> {
        let mealObj = CoreDataMeal(context: context)
        mealObj.setValue(UUID().uuidString, forKey: "id")
        mealObj.setValue(meal.idMeal, forKeyPath: "idMeal")
        mealObj.setValue(meal.name, forKeyPath: "meal")
        mealObj.setValue(meal.imageThumb, forKeyPath: "imageMeal")
        do {
            try self.context.save()
            return Just(true)
        } catch {
            return Just(false)
        }
    }
    
    public func deleteMeal(with meal: Meal) -> Just<Bool> {
        let fetchRequest: NSFetchRequest<CoreDataMeal> = CoreDataMeal.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idMeal = \(meal.idMeal!)")
        do {
            let meals = try context.fetch(fetchRequest)
            for meal in meals {
                context.delete(meal)
            }
            try context.save()
            return Just(true)
        } catch {
            return Just(false)
        }
    }
    
    public func getMealWithID(withID id: String) -> AnyPublisher<Bool, Never> {
        return Future<Bool, Never> { promise in
            let fetchRequest: NSFetchRequest<CoreDataMeal> = CoreDataMeal.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "idMeal = \(id)")
            do {
                let meal = try self.context.fetch(fetchRequest).count
                if meal > 0 {
                    promise(.success(true))
                } else {
                    promise(.success(false))
                }
            } catch {
                print("Error fetch check movie: \(error)")
            }
        }.eraseToAnyPublisher()
    }
    
    public func getMeals() -> AnyPublisher<[Meal], Never> {
        return Future<[Meal], Never> { promise in
            let fetchRequest: NSFetchRequest<CoreDataMeal> = CoreDataMeal.fetchRequest()
            do {
                let mealsObject = try self.context.fetch(fetchRequest)
                var meals: [Meal] = []
                
                for meal in mealsObject {
                    let mealID = meal.value(forKey: "idMeal") as? String ?? ""
                    let mealName = meal.value(forKey: "meal") as? String ?? ""
                    let mealImage = meal.value(forKey: "imageMeal") as? String ?? ""
                    let mealJson: [String: Any] = [
                        "idMeal": mealID,
                        "strMeal": mealName,
                        "strMealThumb": mealImage
                    ]
                    let mealDomain = MealResponse(JSON: mealJson)
                    meals.append(mealDomain!)
                }
                promise(.success(meals))
            } catch {
                print("Error fetch check movie: \(error)")
            }
        }
        .eraseToAnyPublisher()
    }
    
}
