//
//  OnBoardingInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import UIKit
import Data
import Core
import Domain

public protocol OnBoardingInjection {
    func resolveRoute() -> OnBoardingRouteCase
    func resolve() -> OnBoardingViewController
    func resolve() -> OnBoardViewModel
    
    func resolve() -> OnBoardUseCase
    func resolve() -> OnBoardRepository
    func resolve() -> OnBoardDataSource
}

public extension OnBoardingInjection where Self: Injection {
    
    func resolveRoute() -> OnBoardingRouteCase {
        return OnBoardingRouter(injection: self)
    }
    
    func resolve() -> OnBoardingViewController {
        return OnBoardingViewController(router: resolveRoute(), viewModel: resolve())
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
