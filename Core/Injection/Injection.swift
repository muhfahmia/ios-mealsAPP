//
//  Injection.swift
//  Core
//
//  Created by Muhammad Fahmi on 24/11/23.
//

public protocol Injection: CoreInjection,
                    HomeInjection,
                    OnBoardingInjection,
                    FavoriteInjection,
                    DetailInjection,
                    AboutInjection {}
