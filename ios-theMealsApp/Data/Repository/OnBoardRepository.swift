//
//  OnBoardRepository.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 12/11/23.
//

import Combine

protocol OnBoardRepository {
    func getOnBoarding() -> Just<[BoardPage]>
}

struct DefaultBoardRepository: OnBoardRepository {
    
    private let onBoardDataSource: OnBoardDataSource
    
    init(onBoardDataSource: OnBoardDataSource) {
        self.onBoardDataSource = onBoardDataSource
    }
    
    func getOnBoarding() -> Just<[BoardPage]> {
        return onBoardDataSource.getOnBoard()
    }
    
}
