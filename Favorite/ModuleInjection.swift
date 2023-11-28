//
//  ModuleInjection.swift
//  Favorite
//
//  Created by Uwais Alqadri on 25/11/23.
//

import Foundation
import Core

public class ModuleInjection: Injection {}

public protocol Injection: FavoriteInjection, CoreInjection {}

extension Bundle {
    static var current: Bundle {
        Bundle.init(for: ModuleInjection.self)
    }
}
