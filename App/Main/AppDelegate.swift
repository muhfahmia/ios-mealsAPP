//
//  AppDelegate.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import UIKit
import Core
import OnBoarding

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var injection: OnBoardingInjection { 
        OnBoarding.ModuleInjection()
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let router = injection.resolveRoute()
        router.appRoute(window: window)
        return true
    }
    
    
}

