//
//  FavoriteRouter.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 08/11/23.
//

import UIKit
import Core
import Detail

public protocol FavoriteRouteCase {
    func routeToDetail(from vc: UIViewController, withID id: String)
}

public class FavoriteRouter: FavoriteRouteCase {
    
    private let injection: Injection
    
    public init(injection: Injection) {
        self.injection = injection
    }
    
    public func routeToDetail(from vc: UIViewController, withID id: String) {
        let detailInjection = Detail.ModuleInjection()
        let detailRouter = detailInjection.resolveRoute()
        detailRouter.routeToDetail(from: vc, withID: id)
    }
    
}
