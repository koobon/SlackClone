import Foundation
import UIKit

extension Date {
	
	func toString(format: String) -> String {
		let inputFormatter = DateFormatter.init()
		inputFormatter.calendar = Calendar.current
		inputFormatter.dateFormat = format
		
		return inputFormatter.string(from: self)
	}
}

extension String {
	
	func toDate(format: String) -> Date? {
		let inputFormatter = DateFormatter.init()
		inputFormatter.calendar = Calendar.current
		inputFormatter.dateFormat = format
		
		return inputFormatter.date(from: self)
	}
}

