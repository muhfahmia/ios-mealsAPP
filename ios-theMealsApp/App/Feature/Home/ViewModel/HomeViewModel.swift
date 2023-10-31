//
//  HomeViewModel.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import Combine

class HomeViewModel {
    
    private let homeInteractor: HomeUseCase
    private var cancelable = Set<AnyCancellable>()
    
    var categories = PassthroughSubject<[MCategory], Never>()
    var meals = PassthroughSubject<[Meal], Never>()
    
    init(homeInteractor: HomeUseCase) {
        self.homeInteractor = homeInteractor
    }
    
    func getCategories() {
        homeInteractor.getCategories()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    print("finished Categories")
                case .failure(let error):
                    print("errorFromCategories: \(error)")
                }
            }, receiveValue: { [weak self] value in
                self?.categories.send(value.categories!)
            }).store(in: &cancelable)
    }
    
    func getMealsCategories(category: String) {
        homeInteractor.getMeals(category: category)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    print("finished Meals with Categories")
                case .failure(let error):
                    print("errorFromMealsCategories: \(error)")
                }
            }, receiveValue: { [weak self] value in
                self?.meals.send(value.meals!)
            }).store(in: &cancelable)
    }
    
}
