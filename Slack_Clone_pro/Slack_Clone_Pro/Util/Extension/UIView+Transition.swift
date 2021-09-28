import Foundation
import UIKit

extension UIView {
	
	func pushTransition(duration:CFTimeInterval) {		
		let animation:CATransition = CATransition()
		animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
		animation.type = .reveal
		animation.subtype = CATransitionSubtype.fromBottom
		animation.duration = duration
		
		layer.add(animation, forKey: CATransitionType.fade.rawValue)
	}
}
