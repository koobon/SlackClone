//
//  UILabel+Size.swift
//  Pay Manager
//
//  Created by Developer Appg on 2019/12/06.
//  Copyright © 2019 Swan. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {    
    func sizeThatFits(width: CGFloat = CGFloat.greatestFiniteMagnitude) -> CGSize {
        return self.sizeThatFits(CGSize.init(width: width, height: CGFloat.greatestFiniteMagnitude))
    }
}

extension UIButton {
    func sizeThatFits() -> CGSize {
        return self.sizeThatFits(CGSize.init(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude))
    }
}
