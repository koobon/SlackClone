import Foundation
import UIKit

extension Data {
    func toString() -> String? {
        return String(data: self, encoding: .utf8)
    }
}
