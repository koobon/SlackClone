import Foundation
import UIKit

var AssociatedObjectUIButtonTitleTextHandle: UInt8 = 0
var AssociatedObjectUIButtonTitleColorHandle: UInt8 = 0

extension UIButton {
	
	var attributedText: NSAttributedString {
		get {
            var text = objc_getAssociatedObject(self, &AssociatedObjectUIButtonTitleTextHandle) as? NSAttributedString
			if text?.length == 0 {
				text = self.titleLabel?.attributedText
            }
			return text ?? NSAttributedString.init(string: "")
		}
		set {
            objc_setAssociatedObject(self, &AssociatedObjectUIButtonTitleTextHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
//            self.setTransition()
			self.setAttributedTitle(newValue, for: .application)
            self.setAttributedTitle(newValue, for: .disabled)
            self.setAttributedTitle(newValue, for: .focused)
            self.setAttributedTitle(newValue, for: .highlighted)
            self.setAttributedTitle(newValue, for: .normal)
            self.setAttributedTitle(newValue, for: .reserved)
            self.setAttributedTitle(newValue, for: .selected)
		}
	}
	
    var text: String {
        get {
            var text = objc_getAssociatedObject(self, &AssociatedObjectUIButtonTitleTextHandle) as? String
            if EMPTY(text) {
                text = self.titleLabel?.text
            }
            return text ?? ""
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectUIButtonTitleTextHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            
            self.setTitle(newValue, for: .application)
            self.setTitle(newValue, for: .disabled)
            self.setTitle(newValue, for: .focused)
            self.setTitle(newValue, for: .highlighted)
            self.setTitle(newValue, for: .normal)
            self.setTitle(newValue, for: .reserved)
            self.setTitle(newValue, for: .selected)
        }
    }
    
    var textColor: UIColor {
        get {
            var textColor = objc_getAssociatedObject(self, &AssociatedObjectUIButtonTitleColorHandle) as? UIColor
            if EMPTY(text) {
                textColor = self.titleLabel?.textColor
            }
            return textColor ?? UIColor.white
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObjectUIButtonTitleColorHandle, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            self.setTitleColor(newValue, for: .application)
            self.setTitleColor(newValue, for: .disabled)
            self.setTitleColor(newValue, for: .focused)
            self.setTitleColor(newValue, for: .highlighted)
            self.setTitleColor(newValue, for: .normal)
            self.setTitleColor(newValue, for: .reserved)
            self.setTitleColor(newValue, for: .selected)
        }
    }
}
