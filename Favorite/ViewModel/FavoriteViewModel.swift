//
//  FavoriteViewModel.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 07/11/23.
//

import Foundation
import Combine
import Domain
import Data
import Core

public typealias MealsFavoriteInteractor = Interactor<
    Meal, [Meal], MealsListFavoriteRepository<
        MealsFavoriteDataSource
    >
>

public typealias MealsDeleteFavoriteInteractor = Interactor<
    Meal, Bool, MealsDeleteFavoriteRepository<
        MealsFavoriteDataSource
    >
>

public class FavoriteViewModel {
    
    private let favListUseCase: MealsFavoriteInteractor
    private let favDeleteUseCase: MealsDeleteFavoriteInteractor
    private var cancelable = Set<AnyCancellable>()
    var meals = PassthroughSubject<[Meal], Never>()
    
    init(
        favListUseCase: MealsFavoriteInteractor,
        favDeleteUseCase: MealsDeleteFavoriteInteractor
    ) {
        self.favListUseCase = favListUseCase
        self.favDeleteUseCase = favDeleteUseCase
    }
    
    public func getMeals() {
        favListUseCase.execute(request: nil)
        .subscribe(on: DispatchQueue.global(qos: .background))
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { _ in
            
        }, receiveValue: { [weak self] value in
            self?.meals.send(value)
        }).store(in: &cancelable)
    }
    
    public func deleteMeal(with meal: Meal) {
        _ = favDeleteUseCase.execute(request: meal)
    }
    
}
