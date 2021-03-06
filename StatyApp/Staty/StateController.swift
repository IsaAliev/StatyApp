//
//  StateController.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation

protocol StateController {
    var observer: CurrentStateObserver? { get set }
    
    func transitTo(_ newState: State)
    init()
}
