import Foundation
import UIKit

extension UIView {
	
	func setBlur(style: UIBlurEffect.Style) {
		let blurEffect = UIBlurEffect(style: style)
		let blurEffectView = UIVisualEffectView(effect: blurEffect)
		blurEffectView.frame = self.bounds
		
		blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleWidth]
		self.addSubview(blurEffectView)
	}
}
