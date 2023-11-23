//
//  OnBoard.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 22/10/23.
//

import Foundation
import Domain

public struct BoardPageResponse: BoardPage {
    public var viewAnimate: String?
    public var title: String?
    public var desc: String?
    
    public init(viewAnimate: String? = nil, title: String? = nil, desc: String? = nil) {
        self.viewAnimate = viewAnimate
        self.title = title
        self.desc = desc
    }
}

public struct OnBoardingResponse: OnBoard {
    public var page: Int?
    
    public var board: [BoardPage]
    
    public init(page: Int? = nil, board: [BoardPage]) {
        self.page = page
        self.board = board
    }
}
