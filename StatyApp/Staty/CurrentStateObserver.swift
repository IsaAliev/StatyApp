//
//  CurrentStateObserver.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation

protocol CurrentStateObserver: class {
    func didChangeStateTo(_ state: State)
}

fileprivate struct AssociatedKey {
    static var stateController = "kStateController"
}

extension CurrentStateObserver where Self: StateDrivenViewModel {
    var stateController: StateController {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.stateController) as! StateController
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKey.stateController, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func setupStateController<T: StateController>(_ type: T.Type) {
        var controller = T()
        controller.observer = self
        
        stateController = controller
    }
    
    func didChangeStateTo(_ state: State) {
        self.state.value = state
    }
}
