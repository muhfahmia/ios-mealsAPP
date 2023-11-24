//
//  FavoriteRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 08/11/23.
//

import UIKit
import Favorite

public protocol FavoriteRouteCase {
    func routeToDetail(from vc: UIViewController, withID id: String)
}

public class FavoriteRouter: FavoriteRouteCase {
    
    private let injection: Injection
    
    public init(injection: Injection) {
        self.injection = injection
    }
    
    public func routeToDetail(from vc: UIViewController, withID id: String) {
        let detailRouter: MealDetailRouteCase = injection.resolve()
        detailRouter.routeToDetail(from: vc, withID: id)
    }
    
}
