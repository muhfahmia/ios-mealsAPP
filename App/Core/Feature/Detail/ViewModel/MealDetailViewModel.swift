//
//  MealDetailViewModel.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import Foundation
import Combine
import UIKit
import Domain

class MealDetailViewModel {
    
    private let mealDetailUseCase: MealDetailUseCase
    private let favoriteUseCase: FavoriteUseCase
    private var cancelable = Set<AnyCancellable>()
    var meal = PassthroughSubject<Meal?, Never>()
    var mealState = PassthroughSubject<Bool, Never>()
    
    init(detailUseCase: MealDetailUseCase, favoUseCase: FavoriteUseCase) {
        mealDetailUseCase = detailUseCase
        favoriteUseCase = favoUseCase
    }
    
    func getMealDetail(withID id: String) {
        mealDetailUseCase.getMealDetail(withID: id)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished: break
                case .failure(let error):
                    print("error getMealDetail: \(error)")
                }
            }, receiveValue: { [weak self] value in
                self?.meal.send(value.meals?.first!)
            }).store(in: &cancelable)
    }
    
    func addMealFavorite(with meal: Meal) {
        favoriteUseCase.add(with: meal)
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.mealState.send(value)
        }).store(in: &cancelable)
    }
    
    func deleteMealFavorite(with meal: Meal) {
        favoriteUseCase.delete(with: meal)
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            if value == true {
                self?.mealState.send(false)
            }
        }).store(in: &cancelable)
    }
    
    func getMealFavorite(withID id: String) {
        favoriteUseCase.getWithID(withID: id)
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.mealState.send(value)
        }).store(in: &cancelable)
    }
    
}
