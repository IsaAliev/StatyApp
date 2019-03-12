//
//  ViewModel.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation
import Bond

class ViewModel: StateDrivenViewModel, CurrentStateObserver {
    var state = Observable<State?>(nil)
    var stateController = BasicStateController()
    
    func setup() {
        stateController.observer = self
        
        let inState = LoadingState()

        stateController.transitTo(inState)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            let newState = AlertState(message: "Shakeryau")
            let oneMoreState = AlertState(message: "wow wow wow")
            let loading = LoadingState()
            
            self.stateController.transitTo(newState)
            self.stateController.transitTo(oneMoreState)
            self.stateController.transitTo(loading)
        }
    }
}
