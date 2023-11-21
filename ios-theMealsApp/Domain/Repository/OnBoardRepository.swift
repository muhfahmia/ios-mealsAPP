//
//  OnBoardRepository.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/11/23.
//

import Foundation
import Combine

protocol OnBoardRepository {
    func getOnBoarding() -> Just<[BoardPage]>
}
