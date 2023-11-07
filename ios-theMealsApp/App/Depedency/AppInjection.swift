//
//  AppInjection.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 21/10/23.
//
import UIKit

protocol Injection: HomeInjection, OnBoardingInjection, FavoriteInjection, DetailInjection, AboutInjection {}

final class AppInjection: Injection {}
