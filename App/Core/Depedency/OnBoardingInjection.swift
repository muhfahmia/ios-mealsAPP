//
//  OnBoardingInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import UIKit
import Domain
import Data

protocol OnBoardingInjection {
    func resolve() -> OnBoardingRouteCase
    func resolve() -> OnBoardingViewController
    func resolve() -> OnBoardViewModel
    
    func resolve() -> OnBoardUseCase
    func resolve() -> OnBoardRepository
    func resolve() -> OnBoardDataSource
}

extension OnBoardingInjection where Self: Injection {
    
    func resolve() -> OnBoardingRouteCase {
        return OnBoardingRouter(injection: self)
    }
    
    func resolve() -> OnBoardingViewController {
        return OnBoardingViewController(router: resolve(), viewModel: resolve())
    }
    
    func resolve() -> OnBoardViewModel {
        return OnBoardViewModel(onBoardInteractor: resolve())
    }
    
    func resolve() -> OnBoardDataSource {
        return DefaultOnBoardDataSource()
    }
    
    func resolve() -> OnBoardRepository {
        return DefaultBoardRepository(onBoardDataSource: resolve())
    }
    
    func resolve() -> OnBoardUseCase {
        return OnBoardInteractor(onBoardRepo: resolve())
    }
}
