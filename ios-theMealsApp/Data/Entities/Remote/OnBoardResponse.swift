//
//  OnBoard.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import Foundation

struct BoardPageResponse: BoardPage {
    var viewAnimate: String?
    var title: String?
    var desc: String?
    
    init(viewAnimate: String? = nil, title: String? = nil, desc: String? = nil) {
        self.viewAnimate = viewAnimate
        self.title = title
        self.desc = desc
    }
}

struct OnBoardingResponse: OnBoard {
    var page: Int?
    
    var board: [BoardPage]
    
    init(page: Int? = nil, board: [BoardPage]) {
        self.page = page
        self.board = board
    }
}
