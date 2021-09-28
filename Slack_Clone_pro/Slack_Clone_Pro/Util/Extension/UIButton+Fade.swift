import Foundation
import UIKit

extension UIButton {
	func fadeOnOff(color: UIColor, fontColor: UIColor, duration: TimeInterval = 0.3) {
		self.backgroundColor = color
		self.textColor = fontColor
//		self.setTransition(duration: duration)
	}
}
