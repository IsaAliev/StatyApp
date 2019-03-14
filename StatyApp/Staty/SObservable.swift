//
//  SObservable.swift
//  StatyApp
//
//  Created by Isa Aliev on 14.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation

class SObservable<T> {
    typealias ObservationBlock = (T) -> ()
    
    private var observers = [ObservationBlock]()
    
    var value: T {
        didSet {
            notify()
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func observe(_ callback: @escaping ObservationBlock) {
        observers.append(callback)
    }
    
    private func notify() {
        observers.forEach({ $0(value) })
    }
}
