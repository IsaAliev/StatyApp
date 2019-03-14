//
//  LoadingState.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation
import UIKit

class LoadingState: State {
    var target: LoadingStateStrategyProvider?
    lazy var strategy: LoadingStateStrategy? = {
       return target?.loadingStateStrategy()
    }()
    
    func enterOn(_ target: Any) {
        guard let target = target as? LoadingStateStrategyProvider else {
            return
        }
        
        self.target = target
        strategy?.showLoading()
        delegate?.didEnter(self)
    }
    
    func exit() {
        strategy?.hideLoading({ [weak self] in
            guard let self = self else {
                return
            }
            
            self.delegate?.didExit(self)
        })
    }
}

protocol LoadingStateStrategyProvider: class {
    func loadingStateStrategy() -> LoadingStateStrategy
}

protocol LoadingStateStrategy {
    func showLoading()
    func hideLoading(_ completion: @escaping () -> ())
}

extension LoadingStateStrategyProvider where Self: UIViewController {
    func loadingStateStrategy() -> LoadingStateStrategy {
        return IndicatorViewLoadingStrategy(view)
    }
}
