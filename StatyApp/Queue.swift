//
//  Queue.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation

class Queue<T> {
    private var array = [T]()
    
    func enqueue(_ element: T) {
        array.append(element)
    }
    
    func penult() -> T? {
        if array.count == 1 {
            return array.first
        }
        
        if array.count > 1 {
            return array[array.count - 2]
        }
        
        return nil
    }
    
    func last() -> T? {
        return array.last
    }
    
    func first() -> T? {
        return array.first
    }
    
    func dequeue() {
        guard !array.isEmpty else {
            return
        }
        
        array = Array(array.dropFirst())
    }
    
    func isEmpty() -> Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
}
