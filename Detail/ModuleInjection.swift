//
//  ModuleInjection.swift
//  Detail
//
//  Created by Uwais Alqadri on 25/11/23.
//

import Foundation
import Core

public class ModuleInjection: Injection {}

public protocol Injection: DetailInjection, CoreInjection {}

extension Bundle {
    static var current: Bundle {
        Bundle.init(for: ModuleInjection.self)
    }
}
