//
//  OnBoardUseCase.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 12/11/23.
//

import Combine

protocol OnBoardUseCase {
    func get() -> Just<[BoardPage]>
}

class OnBoardInteractor: OnBoardUseCase {
    
    private let onBoardRepo: OnBoardRepository
    
    init(onBoardRepo: OnBoardRepository) {
        self.onBoardRepo = onBoardRepo
    }
    
    func get() -> Just<[BoardPage]> {
        return onBoardRepo.getOnBoarding()
    }
    
}
