//
//  IndicatorViewLoadingStrategy.swift
//  StatyApp
//
//  Created by Isa Aliev on 13.03.2019.
//  Copyright © 2019 IsaAliev. All rights reserved.
//

import Foundation
import UIKit

class IndicatorViewLoadingStrategy: LoadingStateStrategy {
    var view: UIView
    var indicator: UIActivityIndicatorView?
    
    init(_ view: UIView) {
        self.view = view
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
