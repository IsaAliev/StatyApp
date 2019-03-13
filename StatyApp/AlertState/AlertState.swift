//
//  AlertState.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation
import UIKit

class AlertState: State {
    var target: AlertStateStrategyProvider?
    lazy var strategy: AlertStateStrategy? = {
        return target?.alertStateStrategy()
    }()
    
    var message: String = "no"
    var onClose: () -> ()
    
    init(message: String) {
        self.message = message
        self.onClose = {}
        
        self.onClose = { [weak self] in
            guard let self = self else {
                return
            }
            
            self.delegate?.didExit(self)
        }
    }
    
    func enterOn(_ target: Any) {
        guard let target = target as? AlertStateStrategyProvider else {
            return
        }

        self.target = target
        strategy?.showAlertWithMessage(message, onClose: onClose)
        delegate?.didEnter(self)
    }
    
    func exit() {}
}

protocol AlertStateStrategyProvider {
    func alertStateStrategy() -> AlertStateStrategy
}

protocol AlertStateStrategy {
    func showAlertWithMessage(_ message: String, onClose: @escaping () -> ())
}

extension AlertStateStrategyProvider where Self: UIViewController {
    func alertStateStrategy() -> AlertStateStrategy {
        return NativeAlertStrategy(self)
    }
}
