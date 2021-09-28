import Foundation
import UIKit

extension UIView {
	
	var show: Bool {
		get {
			return !isHidden
		}
		set {
			isHidden = !newValue
//			setTransition()
		}
	}
    
    var showAlpha: Bool {
        get {
            return !isHidden
        }
        set {
            if newValue {
//                alpha = 0.0
                isHidden = false
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.3, animations: { [weak self] in
                    self?.alpha = 0.0
                }, completion: { [weak self] _ in
                    self?.isHidden = true
                })
            }
        }
    }
}
