//
//  StateDrivenViewModel.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation
import Bond

protocol StateDrivenViewModel {
    var state: Observable<State?> { get set }
}

typealias StatyViewModel = StateDrivenViewModel & CurrentStateObserver
