//
//  FavoriteUseCase.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 07/11/23.
//

import Combine

protocol FavoriteUseCase {
    func add(with meal: Meal) -> Just<Bool>
    func delete(with meal: Meal) -> Just<Bool>
    func get() -> AnyPublisher<[Meal], Never>
    func getWithID(withID id: String) -> AnyPublisher<Bool, Never>
}

class FavoriteInteractor: FavoriteUseCase {
    
    private let mealsRepo: MealsRepository
    
    init(mealsRepo: MealsRepository) {
        self.mealsRepo = mealsRepo
    }
    
    func add(with meal: Meal) -> Just<Bool> {
        return mealsRepo.addMealFavorite(with: meal)
    }
    
    func delete(with meal: Meal) -> Just<Bool> {
        return mealsRepo.deleteMealFavorite(with: meal)
    }
    
    func get() -> AnyPublisher<[Meal], Never> {
        return mealsRepo.getMealsFavorite()
    }
    
    func getWithID(withID id: String) -> AnyPublisher<Bool, Never> {
        return mealsRepo.getMealFavorite(withID: id)
    }
}
