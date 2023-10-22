//
//  AppInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//

import Foundation

protocol Injection: HomeInjection, OnBoardingInjection {}

final class AppInjection: Injection {}
