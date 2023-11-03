//
//  MealDetailRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import UIKit

protocol MealDetailRouteCase {
    func routeToDetail(from vc: UIViewController, withID id: String)
}

class MealDetailRouter: MealDetailRouteCase {
    
    private let injection: Injection
    
    init(injection: Injection) {
        self.injection = injection
    }
    
    func routeToDetail(from vc: UIViewController, withID id: String) {
        let detailVC: MealDetailViewController = injection.resolve(withID: id)
        detailVC.hidesBottomBarWhenPushed = true
        vc.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
