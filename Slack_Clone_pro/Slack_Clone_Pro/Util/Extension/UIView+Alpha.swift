//
//  UIView+RemoveAlpha.swift
//  Pay Manager
//
//  Created by swany on 2020/07/07.
//  Copyright © 2020 Swan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func removeWithAlpha(duration: Double = 0.3) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        }, completion: { _ in
            self.removeFromSuperview()
            self.alpha = 1.0
        })
    }
    
    func showWithAlpha(duration: Double = 0.3) {
        self.isHidden = false
        self.alpha = 0.0
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        }, completion: nil)
    }
}
