//
//  Injection.swift
//  Core
//
//  Created by Muhammad Fahmi on 24/11/23.
//

import Foundation

public class ModuleInjection: CoreInjection {
    
    public init() {}
}
extension Bundle {
    static var current: Bundle {
        Bundle.init(for: ModuleInjection.self)
    }
}
