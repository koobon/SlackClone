import Foundation
import UIKit

extension UIButton {
	
	func image(name: String) {
		self.setImage(UIImage(named: name), for: .normal)
		self.setImage(UIImage(named: name), for: .highlighted)
		self.setImage(UIImage(named: name), for: .selected)
	}
	
	func selected(type: Bool, animate: Bool, text: String?, color: UIColor?, fontColor: UIColor?) {
		let interval:TimeInterval = animate ? 0.3 : 0.0
		
		if let text = text {
			self.setTitle(text, for: .normal)
		}
		
		self.isSelected = type
		UIView.animate(withDuration: interval, animations: {
			self.backgroundColor = type ? color : .white
			self.setTitleColor(type ? fontColor : .lightGray, for: .normal)
		})
	}
	
	func imageInset() {
		if self.frame.width != self.frame.height {
			self.imageEdgeInsets = UIEdgeInsets(top: self.frame.height/3, left: (self.frame.width-self.frame.height/3)/2, bottom: self.frame.height/3, right: (self.frame.width-self.frame.height/3)/2)
		} else {
			self.imageEdgeInsets = UIEdgeInsets(top: self.frame.height/3, left: self.frame.width/3, bottom: self.frame.height/3, right: self.frame.width/3)
		}
	}
}
