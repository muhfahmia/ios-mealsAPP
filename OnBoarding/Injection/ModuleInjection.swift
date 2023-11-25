//
//  ModuleInjection.swift
//  OnBoarding
//
//  Created by Uwais Alqadri on 25/11/23.
//

import Foundation
import Core

public class ModuleInjection: Injection {
    
    public init() {}
}

public protocol Injection: OnBoardingInjection, CoreInjection {}

extension Bundle {
    static var current: Bundle {
        Bundle.init(for: ModuleInjection.self)
    }
}
