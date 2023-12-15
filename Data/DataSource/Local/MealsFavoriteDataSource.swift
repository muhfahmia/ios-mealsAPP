//
//  MealsFavoriteDataSource.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 06/11/23.
//

import Combine
import Domain
import CoreData
import Core

public class MealsFavoriteDataSource: LocalDataSource {
    
    public typealias Request = Meal
    public typealias Response = Meal

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
    
    public func add(entities: Request) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { promise in
            let mealObj = CoreDataMeal(context: self.context)
            mealObj.setValue(UUID().uuidString, forKey: "id")
            mealObj.setValue(entities.idMeal, forKeyPath: "idMeal")
            mealObj.setValue(entities.name, forKeyPath: "meal")
            mealObj.setValue(entities.imageThumb, forKeyPath: "imageMeal")
            do {
                try self.context.save()
                promise(.success(true))
            } catch {
                promise(.success(false))
            }
        }.eraseToAnyPublisher()
    }
    
    public func list(request: Request?) -> AnyPublisher<[Response], Error> {
        return Future<[Response], Error> { promise in
            let fetchRequest: NSFetchRequest<CoreDataMeal> = CoreDataMeal.fetchRequest()
            do {
                let mealsObject = try self.context.fetch(fetchRequest)
                var meals: [Response] = []
                
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
                promise(.failure(ApiError.failedMapping))
                print("Error fetch check movie: \(error)")
            }
        }.eraseToAnyPublisher()
    }
    
    public func detail(id: String) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { promise in
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
                promise(.failure(ApiError.failedMapping))
                print("Error fetch check movie: \(error)")
            }
        }.eraseToAnyPublisher()
    }
    
    public func delete(entity: Response) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { [weak self] promise in
            guard let self = self else { return }
            let fetchRequest: NSFetchRequest<CoreDataMeal> = CoreDataMeal.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "idMeal = \(entity.idMeal!)")
            do {
                let meals = try context.fetch(fetchRequest)
                for meal in meals {
                    context.delete(meal)
                }
                try context.save()
                promise(.success(true))
            } catch {
                promise(.failure(ApiError.failedMapping))
            }
        }.eraseToAnyPublisher()
    }
}
