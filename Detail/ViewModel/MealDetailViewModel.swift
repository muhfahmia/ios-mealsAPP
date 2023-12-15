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
import Core
import Data

public typealias MealDetailInteractor = Interactor<
    String, Meals, MealsDetailRepository<
        MealsDetailDataSource
    >
  >


public typealias MealsAddFavoriteInteractor = Interactor<
    Meal, Bool, MealsAddFavoriteRepository<
        MealsFavoriteDataSource
    >
  >

public typealias MealsDeleteFavoriteInteractor = Interactor<
    Meal, Bool, MealsDeleteFavoriteRepository<
        MealsFavoriteDataSource
    >
  >

public typealias MealsFavoriteInteractor = Interactor<
    Meal, [Meal], MealsListFavoriteRepository<
        MealsFavoriteDataSource
    >
  >

public class MealDetailViewModel {
    
    private let mealDetailUseCase: MealDetailInteractor
    private let addFavoriteUseCase: MealsAddFavoriteInteractor
    private let deleteFavoriteUseCase: MealsDeleteFavoriteInteractor
    private let listFavoriteUseCase: MealsFavoriteInteractor
    
    private var cancelable = Set<AnyCancellable>()
    
    var meal = PassthroughSubject<Meal?, Never>()
    var mealState = PassthroughSubject<Bool, Never>()
    
    init(mealDetailUseCase: MealDetailInteractor, addFavoriteUseCase: MealsAddFavoriteInteractor, deleteFavoriteUseCase: MealsDeleteFavoriteInteractor, listFavoriteUseCase: MealsFavoriteInteractor) {
        self.mealDetailUseCase = mealDetailUseCase
        self.addFavoriteUseCase = addFavoriteUseCase
        self.deleteFavoriteUseCase = deleteFavoriteUseCase
        self.listFavoriteUseCase = listFavoriteUseCase
    }
    
    public func getMealDetail(withID id: String) {
        mealDetailUseCase.execute(request: id)
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
    
    public func addMealFavorite(with meal: Meal) {
        addFavoriteUseCase.execute(request: meal)
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.mealState.send(value)
        }).store(in: &cancelable)
    }
    
    public func deleteMealFavorite(with meal: Meal) {
        deleteMealFavorite(with: meal)
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            if value == true {
                self?.mealState.send(false)
            }
        }).store(in: &cancelable)
    }
    
    public func getMealFavorite(withID id: String) {
        listFavoriteUseCase.execute(request: <#T##Meal?#>)
        favoriteUseCase.getWithID(withID: id)
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.mealState.send(value)
        }).store(in: &cancelable)
    }
    
}
