//
//  NativeAlertStrategy.swift
//  StatyApp
//
//  Created by Isa Aliev on 13.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation
import UIKit

class NativeAlertStrategy: AlertStateStrategy {
    var controller: UIViewController?
    
    init(_ controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlertWithMessage(_ message: String, onClose: @escaping () -> ()) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            onClose()
        })
        
        controller?.present(alert, animated: true, completion: nil)
    }
}
