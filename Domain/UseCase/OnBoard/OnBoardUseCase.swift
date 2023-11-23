//
//  OnBoardUseCase.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 12/11/23.
//

import Combine

public protocol OnBoardUseCase {
    func get() -> Just<[BoardPage]>
}

public class OnBoardInteractor: OnBoardUseCase {
    
    private let onBoardRepo: OnBoardRepository
    
    public init(onBoardRepo: OnBoardRepository) {
        self.onBoardRepo = onBoardRepo
    }
    
    public func get() -> Just<[BoardPage]> {
        return onBoardRepo.getOnBoarding()
    }
    
}
