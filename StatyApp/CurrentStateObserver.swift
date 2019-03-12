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

extension CurrentStateObserver where Self: StateDrivenViewModel {
    func didChangeStateTo(_ state: State) {
        self.state.value = state
    }
}
