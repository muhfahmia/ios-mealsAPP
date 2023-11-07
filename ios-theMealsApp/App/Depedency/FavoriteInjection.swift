//
//  FavoriteInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

protocol FavoriteInjection {
    func resolve() -> FavoriteViewController
    
    func resolve() -> FavoriteViewModel
    func resolve() -> FavoriteUseCase
}

extension FavoriteInjection where Self: Injection {
    
    func resolve() -> FavoriteViewController {
        return FavoriteViewController(viewModel: resolve())
    }
    
    func resolve() -> FavoriteViewModel {
        return FavoriteViewModel(favUseCase: resolve())
    }
    
    func resolve() -> FavoriteUseCase {
        return FavoriteInteractor(mealsRepo: resolve())
    }
    
}
