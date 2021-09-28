import Foundation
import UIKit

extension String {
	
	var lines: [String] {		
		return self.components(separatedBy: "\n")
	}	
}
