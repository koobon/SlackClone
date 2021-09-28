import Foundation
import UIKit

extension Array where Array.Element: AnyObject {
	
	func index(of element: Element) -> Int? {
		for (currentIndex, currentElement) in self.enumerated() {
			if currentElement === element {
				return currentIndex
			}
		}
		return nil
	}
}

extension Array {
	subscript (safe index: Int) -> Element? {
		// iOS 9 or later
		return indices ~= index ? self[index] : nil
		// iOS 8 or earlier
		// return startIndex <= index && index < endIndex ? self[index] : nil
		// return 0 <= index && index < self.count ? self[index] : nil
	}
}

func isBetween(arr: [Int], index: Int) -> Bool {
	
	var array = arr
	if array.count == 2 {
		if array[0] > array[1] {
			array.swapAt(0, 1)
		}
		if index >= array[0] && index <= array[1] {
			return true
		}
	}
	
	
	return false
}
