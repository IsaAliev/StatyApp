//
//  State.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation

protocol State: class {
    func enterOn(_ target: Any)
    func exit()
}

fileprivate struct AssociatedKey {
    static var delegate = "delegate"
}

extension State {
    var delegate: StateDelegate? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.delegate) as? StateDelegate
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKey.delegate, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}
