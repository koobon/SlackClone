//
//  UIView+Visible.swift
//  Pay Manager
//
//  Created by swany on 2020/11/09.
//  Copyright © 2020 Swan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var isVisible: Bool {
        guard let _ = self.window else {
            return false
        }
        return true
    }
}
