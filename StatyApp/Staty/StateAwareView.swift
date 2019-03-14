//
//  StateAwareView.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation
import UIKit

protocol StateAwareView {
    associatedtype ViewModelType: StateDrivenViewModel
    
    var model: ViewModelType { get set }
}

extension StateAwareView where Self: UIViewController {
    func bindWithState() {
        model.state.observe { [weak self] (state) in
            guard let self = self else {
                return
            }
            
            state?.enterOn(self)
        }
    }
}
