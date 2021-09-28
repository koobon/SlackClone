import Foundation
import UIKit

extension String {
    
    func encodingBase64() -> String {
        if let data = self.data(using: String.Encoding.utf8) {
            let base64Encoded = data.base64EncodedString()
            return base64Encoded
        }
        else {
            return ""
        }
    }
    
}
