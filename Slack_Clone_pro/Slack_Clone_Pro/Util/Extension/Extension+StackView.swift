import Foundation
import UIKit

extension UIStackView {
	
	func stackShadowWithCorner(backgroundColor: UIColor = .white, radiusSize: CGFloat = 12.0) {
		self.backgroundColor = .clear
		
		let subView = UIView(frame: bounds)
		subView.backgroundColor = backgroundColor
		subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		insertSubview(subView, at: 0)
		
		subView.layer.cornerRadius = radiusSize
		subView.layer.masksToBounds = true
		subView.clipsToBounds = true
		
//		subView.shadow(color: .lightGray, size: SHADOW_SIZE, opacity: SHADOW_OPACITY, radius: SHADOW_RADIUS)
	}

    public func make(viewsHidden: [UIView], viewsVisible: [UIView], animated: Bool = true) {
        let viewsHidden = viewsHidden.filter({ $0.superview === self })
        let viewsVisible = viewsVisible.filter({ $0.superview === self })
        
        if !animated {
            for view in viewsVisible {
                if !view.show {
                    view.isHidden = false
                    view.alpha = 1.0
                }
            }
            for view in viewsHidden {
                if view.show {
                    view.isHidden = true
                    view.alpha = 0.0
                }
            }
        } else {
            
            for view in viewsHidden {
                view.alpha = 0.0
            }
            
            UIView.animate(withDuration: 0.5,
                           delay: 0.0,
                           usingSpringWithDamping: SPRING_WITH_DAMPING,
                           initialSpringVelocity: SPRING_VELOCITY,
                           options: [.curveEaseInOut],
                           animations: {
                            
                            for view in viewsVisible {
                                if !view.show {
                                    view.show = true
                                    view.alpha = 1.0
                                }
                            }
                            
                            for view in viewsHidden {
                                if view.show {
                                    view.isHidden = true
                                }
                            }
                            
                            self.layoutIfNeeded()
            }, completion: nil)
        }
    }
}
