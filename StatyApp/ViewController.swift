//
//  ViewController.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import UIKit
import Bond

class ViewController: UIViewController, StateAwareView, AlertStateStrategyProvider, LoadingStateStrategyProvider {
    var model = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindWithState()
        model.setup()
    }
}
