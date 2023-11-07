//
//  FavoriteRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 08/11/23.
//

import UIKit

protocol FavoriteRouteCase {
    func routeToDetail(from vc: UIViewController, withID id: String)
}

class FavoriteRouter: FavoriteRouteCase {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    func routeToDetail(from vc: UIViewController, withID id: String) {
        let detailRouter: MealDetailRouteCase = injection.resolve()
        detailRouter.routeToDetail(from: vc, withID: id)
    }
    
}
