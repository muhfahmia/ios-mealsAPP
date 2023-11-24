//
//  HomeRouteCase.swift
//  Home
//
//  Created by Muhammad Fahmi on 24/11/23.
//

import UIKit

public protocol HomeRouteCase {
    func appRouteHome(window: UIWindow?)
    func routeToHome(from vc: UIViewController)
    func routeToDetail(from vc: UIViewController, withID id: String)
}
