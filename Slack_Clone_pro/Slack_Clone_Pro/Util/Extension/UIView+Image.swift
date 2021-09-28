import Foundation
import UIKit

extension UIView {

    func showShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 1.0
    }
    
    func setInnerShadow(_ frame: CGRect, _ radius: CGFloat = 5.0) {
        let innerShadow = CALayer()
        innerShadow.frame = frame
        
        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: 0, dy:-2), cornerRadius:radius)
        let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius:radius).reversing()
        
        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        
        innerShadow.shadowColor = UIColor.black.cgColor
        innerShadow.shadowOffset = CGSize(width: 0.0, height: 1.0)
        innerShadow.shadowOpacity = 0.5
        innerShadow.shadowRadius = 1.0
        innerShadow.cornerRadius = radius
        self.layer.addSublayer(innerShadow)
        self.clipsToBounds = true
    }
}
