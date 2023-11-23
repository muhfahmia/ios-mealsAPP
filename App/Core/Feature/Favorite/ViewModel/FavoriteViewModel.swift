//
//  FavoriteViewModel.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 07/11/23.
//

import Foundation
import Combine
import Domain

class FavoriteViewModel {
    
    private let favUseCase: FavoriteUseCase
    private var cancelable = Set<AnyCancellable>()
    var meals = PassthroughSubject<[Meal], Never>()
    
    init(favUseCase: FavoriteUseCase) {
        self.favUseCase = favUseCase
    }
    
    func getMeals() {
        favUseCase.get()
        .subscribe(on: DispatchQueue.global(qos: .background))
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { _ in
            
        }, receiveValue: { [weak self] value in
            self?.meals.send(value)
        }).store(in: &cancelable)
    }
    
    func deleteMeal(with meal: Meal) {
        _ = favUseCase.delete(with: meal)
    }
    
}
