import Foundation
import UIKit

extension Int {
	
	var decimal:String {
		let formatter = NumberFormatter()
		formatter.numberStyle = .decimal
		return formatter.string(for: self)!
	}
}
