//
//  MealDetailRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 02/11/23.
//

import UIKit
import Detail

public class MealDetailRouter: MealDetailRouteCase {
    
    private let injection: Injection
    
    public init(injection: Injection) {
        self.injection = injection
    }
    
    public func routeToDetail(from vc: UIViewController, withID id: String) {
        let detailVC: MealDetailViewController = injection.resolve(withID: id)
        detailVC.hidesBottomBarWhenPushed = true
        vc.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
