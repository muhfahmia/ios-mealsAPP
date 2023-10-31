//
//  OnBoard.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 24/10/23.
//

import Foundation

protocol OnBoard {
    var page: Int? { get }
    var board: [Board] { get }
}

protocol Board {
    var viewAnimate: String? { get }
    var title: String? { get }
    var desc: String? { get }
}
