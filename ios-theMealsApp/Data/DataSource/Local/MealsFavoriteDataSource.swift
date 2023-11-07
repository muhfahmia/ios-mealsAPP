//
//  MealsFavoriteDataSource.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 06/11/23.
//

import CoreData
import Combine

protocol MealsFavoriteDataSourceProtocol {
    func deleteMeal(with meal: Meal) -> Just<Bool>
    func addMeal(with meal: Meal) -> Just<Bool>
    func getMeals() -> AnyPublisher<[Meal], Never>
    func getMealWithID(withID id: String) -> AnyPublisher<Bool, Never>
}

class MealsFavoriteDataSource: MealsFavoriteDataSourceProtocol {
    private let container = NSPersistentContainer(name: "CDMeal")
    private let context: NSManagedObjectContext
    private let mealEntity: NSEntityDescription
    
    init() {
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        self.context = container.viewContext
        self.mealEntity = NSEntityDescription.entity(forEntityName: "CDMeal", in: self.context)!
    }
    
    func addMeal(with meal: Meal) -> Just<Bool> {
        let mealObj = NSManagedObject(entity: self.mealEntity, insertInto: self.context)
        mealObj.setValue(meal.idMeal, forKeyPath: "idMeal")
        mealObj.setValue(meal.name, forKeyPath: "meal")
        mealObj.setValue(meal.imageThumb, forKeyPath: "imageMeal")
        do {
            try self.context.save()
            return Just(true)
        } catch {
            return Just(false)
            print("Error saving movie: \(error)")
        }
    }
    
    func deleteMeal(with meal: Meal) -> Just<Bool> {
        let fetchRequest: NSFetchRequest<CDMeal> = CDMeal.fetchRequest()
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
    
    func getMealWithID(withID id: String) -> AnyPublisher<Bool, Never> {
        return Future<Bool, Never> { promise in
            let fetchRequest: NSFetchRequest<CDMeal> = CDMeal.fetchRequest()
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
    
    func getMeals() -> AnyPublisher<[Meal], Never> {
        return Future<[Meal], Never> { promise in
            let fetchRequest: NSFetchRequest<CDMeal> = CDMeal.fetchRequest()
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
