//
//  FavoriteUseCase.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 07/11/23.
//

import Combine

public protocol FavoriteUseCase {
    func add(with meal: Meal) -> Just<Bool>
    func delete(with meal: Meal) -> Just<Bool>
    func get() -> AnyPublisher<[Meal], Never>
    func getWithID(withID id: String) -> AnyPublisher<Bool, Never>
}

public class FavoriteInteractor: FavoriteUseCase {
    
    private let mealsRepo: MealsRepository
    
    public init(mealsRepo: MealsRepository) {
        self.mealsRepo = mealsRepo
    }
    
    public func add(with meal: Meal) -> Just<Bool> {
        return mealsRepo.addMealFavorite(with: meal)
    }
    
    public func delete(with meal: Meal) -> Just<Bool> {
        return mealsRepo.deleteMealFavorite(with: meal)
    }
    
    public func get() -> AnyPublisher<[Meal], Never> {
        return mealsRepo.getMealsFavorite()
    }
    
    public func getWithID(withID id: String) -> AnyPublisher<Bool, Never> {
        return mealsRepo.getMealFavorite(withID: id)
    }
}
