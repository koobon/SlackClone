import Foundation
import UIKit

extension UIImage {
	
	func resizeImage(width: CGFloat) -> UIImage {		
		let newSize = CGSize(width: width, height: self.size.height * width / self.size.width)
		let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
		
		UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
		self.draw(in: rect)
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return newImage!
	}

}
