//
//  ModuleInjection.swift
//  About
//
//  Created by Uwais Alqadri on 27/11/23.
//

import Foundation
import Common

public class ModuleInjection: Injection {
    
    public init() {}
}

public protocol Injection: AboutInjection, CoreInjection {}

extension Bundle {
    static var current: Bundle {
        Bundle.init(for: ModuleInjection.self)
    }
}
