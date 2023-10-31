//
//  OnBoard.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import Foundation

struct Boarding: Board {
    var viewAnimate: String?
    var title: String?
    var desc: String?
    
    init(viewAnimate: String? = nil, title: String? = nil, desc: String? = nil) {
        self.viewAnimate = viewAnimate
        self.title = title
        self.desc = desc
    }
}

struct OnBoarding: OnBoard {
    var page: Int?
    
    var board: [Board]
    
    init(page: Int? = nil, board: [Board]) {
        self.page = page
        self.board = board
    }
}
