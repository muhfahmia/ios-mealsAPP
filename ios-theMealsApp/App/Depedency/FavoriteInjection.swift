//
//  FavoriteInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

protocol FavoriteInjection {
    func resolve() -> FavoriteViewController
    
    func resolve() -> FavoriteUseCase
}

extension FavoriteInjection where Self: Injection {
    
    func resolve() -> FavoriteViewController {
        return FavoriteViewController()
    }
    
    func resolve() -> FavoriteUseCase {
        return FavoriteInteractor(mealsRepo: resolve())
    }
    
}
