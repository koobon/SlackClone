import Foundation
import UIKit

extension String {
    
    func date(format: String) -> Date {
        let inputFormatter = DateFormatter.init()
        inputFormatter.dateFormat = format
        
        return inputFormatter.date(from: format)!
    }
}
