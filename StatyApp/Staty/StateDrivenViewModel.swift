//
//  StateDrivenViewModel.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation

protocol StateDrivenViewModel {
    var state: SObservable<State?> { get set }
}

typealias StatyViewModel = StateDrivenViewModel & CurrentStateObserver
