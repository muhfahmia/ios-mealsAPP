//
//  ModuleInjection.swift
//  Home
//
//  Created by Uwais Alqadri on 25/11/23.
//

import Foundation
import Core

class ModuleInjection: Injection {}

protocol Injection: HomeInjection, CoreInjection {}

extension Bundle {
    static var current: Bundle {
        Bundle.init(for: ModuleInjection.self)
    }
}
