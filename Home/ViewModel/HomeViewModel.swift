//
//  HomeViewModel.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import Combine
import Domain

public class HomeViewModel {
    
    let homeInteractor: HomeUseCase
    private var cancelable = Set<AnyCancellable>()
    
    var categories = PassthroughSubject<[MCategory], Never>()
    var meals = PassthroughSubject<[Meal], Never>()
    var mealsFav = PassthroughSubject<[Meal], Never>()
    
    public init(homeInteractor: HomeUseCase) {
        self.homeInteractor = homeInteractor
    }
    
    public func getCategories() {
        homeInteractor.getCategories()
        .subscribe(on: DispatchQueue.global(qos: .background))
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { result in
            switch result {
            case .finished: break
            case .failure(let error):
                print("errorFromCategories: \(error)")
            }
        }, receiveValue: { [weak self] value in
            self?.categories.send(value.categories!)
        }).store(in: &cancelable)
    }
    
    public func getMealsCategories(category: String) {
        homeInteractor.getMeals(category: category)
        .subscribe(on: DispatchQueue.global(qos: .background))
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { result in
            switch result {
            case .finished: break
            case .failure(let error):
                print("errorFromMealsCategories: \(error)")
            }
        }, receiveValue: { [weak self] value in
            self?.meals.send(value.meals!)
        }).store(in: &cancelable)
    }
    
    public func getMealsFav(category: String) {
        homeInteractor.getMeals(category: category)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { result in
            switch result {
            case .finished: break
            case .failure(let error):
                print("errorFromMealsCategories: \(error)")
            }
        }, receiveValue: { [weak self] value in
            self?.mealsFav.send(value.meals!)
        }).store(in: &cancelable)
    }
    
}
