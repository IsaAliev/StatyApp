//
//  ViewModel.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation
import Bond

class ViewModel: StatyViewModel {
    var state = Observable<State?>(nil)

    func setup() {
        setupStateController(BasicStateController.self)
        
        let inState = LoadingState()
        stateController.transitTo(inState)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let newState = AlertState(message: "Staty First")
            let oneMoreState = AlertState(message: "Staty Second")
            let loading = LoadingState()
            
            self.stateController.transitTo(newState)
            self.stateController.transitTo(oneMoreState)
            self.stateController.transitTo(loading)
        }
    }
}
