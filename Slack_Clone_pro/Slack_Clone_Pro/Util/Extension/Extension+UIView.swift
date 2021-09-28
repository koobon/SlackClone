import Foundation
import UIKit

extension UIView {
	
	@IBInspectable
	var shadow: Bool {
		get {
			return true
		}
		set {
			shadow(color: .lightGray, size: SHADOW_SIZE, opacity: SHADOW_OPACITY, radius: SHADOW_RADIUS)
		}
	}
	
	@IBInspectable
	var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}
	
	@IBInspectable
	var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}
	
	@IBInspectable
	var borderColor: UIColor? {
		get {
			if let color = layer.borderColor {
				return UIColor(cgColor: color)
			}
			return nil
		}
		set {
			if let color = newValue {
				layer.borderColor = color.cgColor
			} else {
				layer.borderColor = nil
			}
		}
	}
	
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor? = .lightGray, width: CGFloat = 0.3) {
        for edge in arr_edge {
			let border = UIView.init()
            addSubview(border)
            switch edge {
			
            case .top:
				border.addTopConstant(constant: 0.0)
				border.addLeadingConstant(constant: 0.0)
				border.addTrailingConstant(constant: 0.0)
				border.addHeightConstant(constant: width)
            case .bottom:
				border.addBottomConstant(constant: 0.0)
				border.addLeadingConstant(constant: 0.0)
				border.addTrailingConstant(constant: 0.0)
				border.addHeightConstant(constant: width)
            case .left:
				border.addTopConstant(constant: 0.0)
				border.addBottomConstant(constant: 0.0)
				border.addLeadingConstant(constant: 0.0)
				border.addWidthConstant(constant: width)
            case .right:
				border.addTopConstant(constant: 0.0)
				border.addBottomConstant(constant: 0.0)
				border.addTrailingConstant(constant: 0.0)
				border.addWidthConstant(constant: width)
            default:
                break
            }
			if let color = color {
				border.backgroundColor = color
			}
        }
    }
	
    func removeSubviews(without: Int = -1) {
        if let v = self as? UIStackView {
            let _ = v.arrangedSubviews.enumerated().compactMap { value in
                if value.offset != without {
                    value.element.removeFromSuperview()
                }
            }
        } else {
            subviews.map {
                $0.removeFromSuperview()
            }
        }
    }
	
    func setCorner(radius: CGFloat = 8.0) {
		layer.cornerRadius = radius
		layer.masksToBounds = true
		layer.isOpaque = false
	}
	
	func border(color: UIColor, width: CGFloat) {
		layer.borderColor = color.cgColor
		layer.borderWidth = width
	}
	
	func shadow(color: UIColor, size: CGSize, opacity: Float, radius: CGFloat) {
		layer.shadowColor = color.cgColor
		layer.shadowOffset = size
		layer.shadowOpacity = opacity
		layer.shadowRadius = radius
		layer.masksToBounds = false
	}
    
    func setShadowWithCornerRadius(color: UIColor = .lightGray, corners: CGFloat = 8.0) {
		layer.cornerRadius = corners
        layer.masksToBounds = true
        
		let shadowPath2 = UIBezierPath(rect: bounds)
		layer.shadowColor = UIColor.darkGray.cgColor
		layer.shadowOffset = SHADOW_SIZE
		layer.shadowOpacity = SHADOW_OPACITY
		layer.shadowRadius = SHADOW_RADIUS
		layer.shadowPath = shadowPath2.cgPath
	}
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
    
	func shake() {
		let animation = CABasicAnimation(keyPath: "position")
		animation.duration = 0.1
		animation.repeatCount = 2
		animation.autoreverses = true
		animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 5, y: center.y))
		animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 5, y: center.y))
		layer.add(animation, forKey: "position")
	}
	
    func shadowWithCorner(color: UIColor = UIColor.darkGray, radius: CGFloat) {
		layer.cornerRadius = radius
        layer.masksToBounds = false
		
		layer.shadowColor = color.cgColor
		layer.shadowOffset = SHADOW_SIZE
		layer.shadowOpacity = SHADOW_OPACITY
		layer.shadowRadius = SHADOW_RADIUS
		
		for view in subviews {
            if !view.isKind(of: UILabel.self) && !view.isKind(of: UIButton.self) {
                view.layer.cornerRadius = radius
                view.clipsToBounds = true
            }
		}
	}
	
    func setShadowNormal(color: UIColor = .lightGray) {
		shadow(color: color, size: SHADOW_SIZE, opacity: SHADOW_OPACITY, radius: SHADOW_RADIUS)
	}
	
    func setTransition(duration: TimeInterval = 0.3, completion: (()->())? = nil) {
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: nil) { _ in
            completion?()
        }
	}
    
    func fadeIn(duration: TimeInterval = 0.3) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    func fadeOut(duration: TimeInterval = 0.3, completion: (()->())? = nil) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        }, completion: { _ in
            completion?()
        })
    }
    
    func fadeInTransform(duration: TimeInterval = 0.5, scale: CGFloat, completion: (()->())? = nil) {
        alpha = 0.0
        transform = .init(scaleX: scale, y: scale)
        UIView.animate(withDuration: duration,
                       delay: 0.0,
                       usingSpringWithDamping: SPRING_WITH_DAMPING,
                       initialSpringVelocity: SPRING_VELOCITY,
                       options: [.curveEaseInOut],
                       animations: {
                        self.alpha = 1.0
                        self.transform = .identity
        }, completion: { _ in
            completion?()
        })
    }
    
    func fadeOutTransform(duration: TimeInterval = 0.5, scale: CGFloat, velocity: Bool, completion: (()->())? = nil) {
        UIView.animate(withDuration: duration,
                       animations: {
                        self.alpha = 0.0
                        self.transform = .init(scaleX: scale, y: scale)
        }, completion: { _ in
            completion?()
        })
    }
    
    func animateBorderColor(toColor: UIColor, duration: Double) {
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "borderColor")
        animation.fromValue = layer.borderColor
        animation.toValue = toColor.cgColor
        animation.duration = duration
        layer.add(animation, forKey: "borderColor")
        layer.borderColor = toColor.cgColor
    }
	
	
	func addRoundCorner(corners: UIRectCorner = [.allCorners], radius: CGFloat) {
		if #available(iOS 11.0, *) {
			clipsToBounds = true
			layer.cornerRadius = radius
			layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
		} else {
			let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
			let mask = CAShapeLayer()
			mask.path = path.cgPath
			layer.mask = mask
		}
	}
	
	
	
	@discardableResult
	func addBorders(edges: UIRectEdge,
					color: UIColor,
					inset: CGFloat = 0.0,
					thickness: CGFloat = 1.0) -> [UIView] {

		var borders = [UIView]()

		@discardableResult
		func addBorder(formats: String...) -> UIView {
			let border = UIView(frame: .zero)
			border.backgroundColor = color
			border.translatesAutoresizingMaskIntoConstraints = false
			addSubview(border)
			addConstraints(formats.flatMap {
				NSLayoutConstraint.constraints(withVisualFormat: $0,
											   options: [],
											   metrics: ["inset": inset, "thickness": thickness],
											   views: ["border": border]) })
			borders.append(border)
			return border
		}


		if edges.contains(.top) || edges.contains(.all) {
			addBorder(formats: "V:|-0-[border(==thickness)]", "H:|-inset-[border]-inset-|")
		}

		if edges.contains(.bottom) || edges.contains(.all) {
			addBorder(formats: "V:[border(==thickness)]-0-|", "H:|-inset-[border]-inset-|")
		}

		if edges.contains(.left) || edges.contains(.all) {
			addBorder(formats: "V:|-inset-[border]-inset-|", "H:|-0-[border(==thickness)]")
		}

		if edges.contains(.right) || edges.contains(.all) {
			addBorder(formats: "V:|-inset-[border]-inset-|", "H:[border(==thickness)]-0-|")
		}

		return borders
	}
	
}
