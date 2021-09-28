import Foundation
import UIKit

extension String {

    func nsRange(of string: String,
                 options: CompareOptions = .literal,
                 range: Range<Index>? = nil,
                 locale: Locale? = nil) -> NSRange {
        guard let range = self.range(of: string,
                                     options: options,
                                     range: range ?? startIndex..<endIndex,
                                     locale: locale ?? .current) else { return NSRange(location: 0, length: 0) }
        return NSRange(range, in: self)
    }
    
}
