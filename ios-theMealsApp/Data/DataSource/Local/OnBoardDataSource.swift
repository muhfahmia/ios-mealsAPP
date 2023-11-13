//
//  OnBoardDataSource.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 09/11/23.
//

import Combine

protocol OnBoardDataSource {
    func getOnBoard() -> Just<[BoardPage]>
}

struct DefaultOnBoardDataSource: OnBoardDataSource {
    func getOnBoard() -> Just<[BoardPage]> {
        let boarding: [BoardPage] = [
            BoardPageResponse(viewAnimate: "boarding-1", title: "Welcome to Meals App", desc: "This application is intended for those of you who are looking for delicious and healthy food"),
            BoardPageResponse(viewAnimate: "boarding-2", title: "Handmade by Fahmi", desc: "Delicious food is the result of a Great Chef"),
            BoardPageResponse(viewAnimate: "boarding-3", title: "Find your Favorite", desc: "There are various kinds of food choices in this application. Come on, find your favorite food"),
        ]
        return Just(boarding)
    }
}
