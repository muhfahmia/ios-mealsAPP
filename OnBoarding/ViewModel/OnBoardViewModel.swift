//
//  OnBoardViewModel.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 12/11/23.
//

import Combine
import Foundation
import Domain
import Core
import Data

public typealias OnBoardListInteractor = Interactor<
    Any, [BoardPage], GetOnBoardingRepository<
        OnBoardDataSource
    >
>

public class OnBoardViewModel {
    
    private let onBoardInteractor: OnBoardListInteractor
    private var cancelable = Set<AnyCancellable>()
    var boardingPage = PassthroughSubject<[BoardPage], Never>()
    
    public init(onBoardInteractor: OnBoardListInteractor) {
        self.onBoardInteractor = onBoardInteractor
    }
    
    public func get() {
        onBoardInteractor.execute(request: nil)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { result in
            switch result {
            case .finished: break
            case .failure(let error):
                print("errorFromCategories: \(error)")
            }
        }, receiveValue: { [weak self] value in
            self?.boardingPage.send(value)
        }).store(in: &cancelable)
    }
    
}
