import Foundation
import UIKit

// Int형을 급여형식 ###,### String으로 변환해주는 함수입니다.
extension Int {
    
    func currency() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(for: self)!
    }
}
