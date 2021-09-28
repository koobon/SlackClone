import Foundation
import UIKit

extension UIScrollView {
	
    func scrollToOffsetY(offset: CGFloat, delay: Double = 0.0, animated: Bool) {
        dispatchDelay(delay: delay) {
            UIView.animate(withDuration: animated ? 0.5 : 0.0, delay: 0.0,
                           usingSpringWithDamping: SPRING_WITH_DAMPING,
                           initialSpringVelocity: SPRING_VELOCITY,
                           options: [.curveEaseInOut],
                           animations: {
                            self.contentOffset = .init(x: 0.0, y: offset)
            }, completion: nil)
        }
    }
    
	func scrollToPage(_ page: Int, _ animated: Bool) {
		if animated {
			UIView.animate(withDuration: 0.3,
                           delay: 0.0,
                           usingSpringWithDamping: SPRING_WITH_DAMPING,
                           initialSpringVelocity: SPRING_VELOCITY,
                           options: [.curveEaseInOut],
                           animations: {
                            self.contentOffset.x = self.frame.width * CGFloat(page - 1)
            }, completion: nil)
        } else {
            self.contentOffset.x = self.frame.width*CGFloat(page - 1)
		}
	}
	
	func scrollToBottom(animated: Bool? = true) {
		let bottomOffset = CGPoint(x: 0, y: self.contentSize.height - self.bounds.size.height + self.contentInset.bottom)
		self.setContentOffset(bottomOffset, animated: true)
	}
	
	func scrollToTop(animated: Bool = true) {
        self.setContentOffset(.zero, animated: animated)
	}
	
	// Top 일경우
	var isTop: Bool {
		return contentOffset.y <= verticalOffsetForTop
	}
	
	// Bottom 일경우
	var isBottom: Bool {
		return contentOffset.y >= verticalOffsetForBottom
	}
	
	var verticalOffsetForTop: CGFloat {
		let topInset = contentInset.top
		return -topInset
	}
	
	var verticalOffsetForBottom: CGFloat {
		let scrollViewHeight = bounds.height
		let scrollContentSizeHeight = contentSize.height
		let bottomInset = contentInset.bottom
		let scrollViewBottomOffset = scrollContentSizeHeight+bottomInset-scrollViewHeight
		return scrollViewBottomOffset
	}
	
}
