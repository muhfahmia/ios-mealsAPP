//
//  ModuleInjection.swift
//  Favorite
//
//  Created by Uwais Alqadri on 25/11/23.
//

import Foundation
import Common

public class FavoriteModule: Injection {
    
    public init() {}
}

public protocol Injection: FavoriteInjection, CoreInjection {}

extension Bundle {
    static var current: Bundle {
        Bundle.init(for: FavoriteModule.self)
    }
}
