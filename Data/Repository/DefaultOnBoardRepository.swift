//
//  OnBoardRepository.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 12/11/23.
//

import Combine
import Domain

public struct DefaultBoardRepository: OnBoardRepository {
    
    private let onBoardDataSource: OnBoardDataSource
    
    public init(onBoardDataSource: OnBoardDataSource) {
        self.onBoardDataSource = onBoardDataSource
    }
    
    public func getOnBoarding() -> Just<[BoardPage]> {
        return onBoardDataSource.getOnBoard()
    }
    
}
