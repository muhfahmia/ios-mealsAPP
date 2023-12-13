//
//  ModuleInjection.swift
//  Home
//
//  Created by Uwais Alqadri on 25/11/23.
//

import Foundation
import Common

public class ModuleInjection: Injection {
    public init() {}
}

public protocol Injection: HomeInjection, CoreInjection {}

extension Bundle {
    static var current: Bundle {
        Bundle.init(for: ModuleInjection.self)
    }
}
