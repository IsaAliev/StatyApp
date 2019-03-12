//
//  LoadingState.swift
//  StatyApp
//
//  Created by Isa Aliev on 12.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation
import Bond

class LoadingState: State {
    var target: LoadingStateRepresentable?
    
    func enterOn(_ target: Any) {
        guard let target = target as? LoadingStateRepresentable else {
            return
        }
        
        self.target = target
        target.showLoading()
        delegate?.didEnter(self)
    }
    
    func exit() {
        target?.hideLoading({ [weak self] in
            guard let self = self else {
                return
            }
            
            self.delegate?.didExit(self)
        })
    }
}

protocol LoadingStateRepresentable: class {
    func showLoading()
    func hideLoading(_ completion: @escaping () -> ())
}

fileprivate struct AssociatedKey {
    static var indicator = "indicator"
}

extension LoadingStateRepresentable where Self: UIViewController {
    var indicator: UIActivityIndicatorView? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKey.indicator) as? UIActivityIndicatorView
        }
        
        set {
            return objc_setAssociatedObject(self, &AssociatedKey.indicator, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func showLoading() {
        indicator = UIActivityIndicatorView(style: .gray)
        indicator!.center = view.center
        indicator!.startAnimating()
        
        view.addSubview(indicator!)
    }
    
    func hideLoading(_ completion: @escaping () -> ()) {
        guard let indicator = indicator else {
            return
        }
        
        UIView.animate(withDuration: 0.6, animations: {
            indicator.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
        }) { _ in
            indicator.removeFromSuperview()
            completion()
        }
    }
}
