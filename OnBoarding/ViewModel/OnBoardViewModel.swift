//
//  OnBoardViewModel.swift
//  ios-theMealsApp
//
//  Created by Muhammad Fahmi on 12/11/23.
//

import Combine
import Foundation
import Domain

public class OnBoardViewModel {
    
    private let onBoardInteractor: OnBoardUseCase
    private var cancelable = Set<AnyCancellable>()
    var boardingPage = PassthroughSubject<[BoardPage], Never>()
    
    public init(onBoardInteractor: OnBoardUseCase) {
        self.onBoardInteractor = onBoardInteractor
    }
    
    public func get() {
        onBoardInteractor.get()
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] value in
            self?.boardingPage.send(value)
        }).store(in: &cancelable)
    }
    
}
