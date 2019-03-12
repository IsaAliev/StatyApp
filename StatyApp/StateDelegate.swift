//
//  StateDelegate.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation

protocol StateDelegate {
    func didExit(_ state: State)
    func didEnter(_ state: State)
}
