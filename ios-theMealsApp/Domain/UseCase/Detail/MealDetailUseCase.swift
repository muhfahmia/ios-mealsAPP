//
//  MealDetail.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import Combine

protocol MealDetailUseCase {
    func getMealDetail(withID id: String) -> AnyPublisher<MealsResponse, Error>
}

class MealDetailInteractor: MealDetailUseCase {
    
    private let mealRepo: MealsRepository
    
    init(mealRepo: MealsRepository) {
        self.mealRepo = mealRepo
    }
    
    func getMealDetail(withID id: String) -> AnyPublisher<MealsResponse, Error> {
        return mealRepo.getMealDetail(withID: id)
    }
    
}
