//
//  OnBoard.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 24/10/23.
//

import Foundation

public protocol OnBoard {
    var page: Int? { get }
    var board: [BoardPage] { get }
}

public protocol BoardPage {
    var viewAnimate: String? { get }
    var title: String? { get }
    var desc: String? { get }
}
