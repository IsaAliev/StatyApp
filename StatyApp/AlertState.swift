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
        guard let target = target as? AlertStateRepresentable else {
            return
        }
        
        target.showAlertWithMessage(message, onClose: onClose)
        delegate?.didEnter(self)
    }
    
    func exit() {}
}

protocol AlertStateRepresentable {
    func showAlertWithMessage(_ message: String, onClose: @escaping () -> ())
}

extension AlertStateRepresentable where Self: UIViewController {
    func showAlertWithMessage(_ message: String, onClose: @escaping () -> ()) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            onClose()
        })
        
        present(alert, animated: true, completion: nil)
    }
}
