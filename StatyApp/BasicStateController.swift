//
//  BasicStateController.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation

class BasicStateController: StateController {
    var stateQueue = Queue<State>()
    
    weak var observer: CurrentStateObserver?
    
    func transitTo(_ newState: State) {
        newState.delegate = self
        stateQueue.enqueue(newState)

        if stateQueue.count == 1 {
            observer?.didChangeStateTo(newState)

            return
        }
        
        stateQueue.penult()?.exit()
    }
    
    func moveToNextState() {
        guard stateQueue.count > 1 else {
            return
        }
        
        stateQueue.dequeue()
        
        if let state = stateQueue.first() {
            observer?.didChangeStateTo(state)
        }
    }
}

extension BasicStateController: StateDelegate {
    func didExit(_ state: State) {
        print("out \(state)")
        
        moveToNextState()
    }
    
    func didEnter(_ state: State) {
        print("in \(state)")
    }
}
