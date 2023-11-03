//
//  MealDetailViewModel.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import Foundation
import Combine

class MealDetailViewModel {
    
    private let mealDetailUseCase: MealDetailUseCase
    private var cancelable = Set<AnyCancellable>()
    var meal = PassthroughSubject<Meal?, Never>()
    
    init(mealDetailUseCase: MealDetailUseCase) {
        self.mealDetailUseCase = mealDetailUseCase
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
    
}
