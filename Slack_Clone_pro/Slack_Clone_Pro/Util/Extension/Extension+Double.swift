import Foundation
import UIKit

extension Double {
	
	var decimal: String {
		get {
			let formatter = NumberFormatter()
			formatter.numberStyle = .decimal
			return formatter.string(for: self)!
		}
	}
	
	var toIntToDouble: Double {
		return Double(Int(self))
	}
}
