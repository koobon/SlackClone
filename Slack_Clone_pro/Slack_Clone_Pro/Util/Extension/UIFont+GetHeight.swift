import Foundation
import UIKit

extension UIFont {
	
	func calculateHeight(text: String, width: CGFloat) -> CGFloat {
		let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
		let boundingBox = text.boundingRect(with: constraintRect,
											options: NSStringDrawingOptions.usesLineFragmentOrigin,
											attributes: [NSAttributedString.Key.font: self],
											context: nil)
		return boundingBox.height
	}
	
}
