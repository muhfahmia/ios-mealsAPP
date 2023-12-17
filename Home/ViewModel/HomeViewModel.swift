//
//  HomeViewModel.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 26/10/23.
//

import Foundation
import Combine
import Domain
import Data
import Core

public typealias MealsCategoriesInteractor = Interactor<
    String, Categories, MealsCategoriesRepository<
        MealsCategoriesDataSource
    >
>

public typealias MealsByCategoriesInteractor = Interactor<
    String, Meals, MealsByCategoriesRepository<
        MealsByCategoriesDataSource
    >
>

public class HomeViewModel {
    
    private let mealsByCategoriesInteractor: MealsByCategoriesInteractor
    private let mealCategoriesInteractor: MealsCategoriesInteractor
    private var cancelable = Set<AnyCancellable>()
    
    var categories = PassthroughSubject<[MCategory], Never>()
    var meals = PassthroughSubject<[Meal], Never>()
    var mealsFav = PassthroughSubject<[Meal], Never>()
    
    public init(
        mealsByCategoriesInteractor: MealsByCategoriesInteractor,
        mealCategoriesInteractor: MealsCategoriesInteractor
    ) {
        self.mealsByCategoriesInteractor = mealsByCategoriesInteractor
        self.mealCategoriesInteractor = mealCategoriesInteractor
    }
    
    public func getCategories() {
        mealCategoriesInteractor.execute(request: nil)
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
        mealsByCategoriesInteractor.execute(request: category)
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
        mealsByCategoriesInteractor.execute(request: category)
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
