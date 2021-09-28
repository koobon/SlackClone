import Foundation
import UIKit

extension UIView {

	func addRatioSelfConstant(constant: (CGFloat)) {
	           	self.disableTranslatesAutoresizingMaskIntoConstraints()
		self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: constant, constant: 0))
	}
	
	func addLeadingItemConstant(toItem: UIView, constant: (CGFloat)) {
		self.disableTranslatesAutoresizingMaskIntoConstraints()
		self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .leading, relatedBy: .equal, toItem: toItem, attribute: .trailing, multiplier: 1.0, constant: constant))
	}
	
	func addBottomItemToBottomConstant(toItem: UIView, constant: (CGFloat)) {
		self.disableTranslatesAutoresizingMaskIntoConstraints()
		self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .bottom, relatedBy: .equal, toItem: toItem, attribute: .bottom, multiplier: 1.0, constant: constant))
	}
	
	func addTopItemToBottomConstant(toItem: UIView, constant: (CGFloat)) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: .equal, toItem: toItem, attribute: .bottom, multiplier: 1.0, constant: constant))
    }
    
    func addTopItemToTopConstant(toItem: UIView, constant: (CGFloat)) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: .equal, toItem: toItem, attribute: .top, multiplier: 1.0, constant: constant))
    }
	
    func addTopConstant(constant: (CGFloat), relatedBy: NSLayoutConstraint.Relation = .equal) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: relatedBy, toItem: self.superview, attribute: .top, multiplier: 1.0, constant: constant))
    }
    
    func addBottomConstant(constant: (CGFloat), relatedBy: NSLayoutConstraint.Relation = .equal) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .bottom, relatedBy: relatedBy, toItem: self.superview, attribute: .bottom, multiplier: 1.0, constant: constant))
    }
    
    func addLeadingConstant(constant: (CGFloat), relatedBy: NSLayoutConstraint.Relation = .equal) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .leading, relatedBy: relatedBy, toItem: self.superview, attribute: .leading, multiplier: 1.0, constant: constant))
    }
    
    func addTrailingConstant(constant: (CGFloat), relatedBy: NSLayoutConstraint.Relation = .equal) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .trailing, relatedBy: relatedBy, toItem: self.superview, attribute: .trailing, multiplier: 1.0, constant: constant))
    }
    
	func addWidthConstant(constant: (CGFloat), relatedBy: NSLayoutConstraint.Relation = .equal) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
		self.addConstraint(NSLayoutConstraint.init(item: self, attribute: .width, relatedBy: relatedBy, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: constant))
    }
    
    func addHeightConstant(constant: (CGFloat), relatedBy: NSLayoutConstraint.Relation = .equal) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.addConstraint(NSLayoutConstraint.init(item: self, attribute: .height, relatedBy: relatedBy, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: constant))
    }
	
	func addEqualHeightToItem(toItem: UIView) {
		self.disableTranslatesAutoresizingMaskIntoConstraints()
		self.addConstraint(NSLayoutConstraint.init(item: toItem, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 0.0))
	}
	
	func addEqualWidthToItem(toItem: UIView) {
		self.disableTranslatesAutoresizingMaskIntoConstraints()
		self.addConstraint(.init(item: toItem, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 0.0))
	}
    
    func addCenterHorizontalConstant(constant: (CGFloat)) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .centerX, relatedBy: .equal, toItem: self.superview, attribute: .centerX, multiplier: 1.0, constant: constant))
    }
    
    func addCenterVerticalConstant(constant: (CGFloat)) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .centerY, relatedBy: .equal, toItem: self.superview, attribute: .centerY, multiplier: 1.0, constant: constant))
    }
    
    func addHorizontalSpaceTo(relateView: Any, constant: (CGFloat)) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .leading, relatedBy: .equal, toItem: relateView, attribute: .trailing, multiplier: 1.0, constant: constant))
    }
    
    func addVerticalSpaceTo(relateView: Any, constant: (CGFloat)) {
        self.disableTranslatesAutoresizingMaskIntoConstraints()
        self.superview?.addConstraint(NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: .equal, toItem: relateView, attribute: .bottom, multiplier: 1.0, constant: constant))        
    }
    
    func fillHorizontalToSuperview() {
        self.addLeadingConstant(constant: 0.0)
        self.addTrailingConstant(constant: 0.0)
    }
    
    func fillVerticalToSuperview() {
        self.addTopConstant(constant: 0.0)
        self.addBottomConstant(constant: 0.0)
    }
    
    func fillToSuperView()  {
        self.fillHorizontalToSuperview()
        self.fillVerticalToSuperview()
    }
    
    func disableTranslatesAutoresizingMaskIntoConstraints() {
        if(self.translatesAutoresizingMaskIntoConstraints) {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

extension NSLayoutConstraint {
    func constraintWithMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item: self.firstItem!, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: multiplier, constant: self.constant)
    }
}
