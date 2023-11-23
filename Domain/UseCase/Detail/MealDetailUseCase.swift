//
//  MealDetail.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import Combine

public protocol MealDetailUseCase {
    func getMealDetail(withID id: String) -> AnyPublisher<Meals, Error>
}

public class MealDetailInteractor: MealDetailUseCase {
    
    private let mealRepo: MealsRepository
    
    public init(mealRepo: MealsRepository) {
        self.mealRepo = mealRepo
    }
    
    public func getMealDetail(withID id: String) -> AnyPublisher<Meals, Error> {
        return mealRepo.getMealDetail(withID: id)
    }
    
}
