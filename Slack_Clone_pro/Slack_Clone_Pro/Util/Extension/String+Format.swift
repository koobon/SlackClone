import Foundation
import UIKit

extension String {

    static func numberFormatFromNumber(_ value: NSNumber) -> String? {
        let numberFormatter: NumberFormatter = NumberFormatter.init()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: value)
    }
    
    static func numberFormatFromInt(_ value: Int) -> String? {
        return self.numberFormatFromNumber(NSNumber.init(value: value))
    }
    
    static func numberFormatFromInteger(_ value: NSInteger) -> String? {
        return self.numberFormatFromNumber(NSNumber.init(value: value))
    }
    
    func attributedHtmlString() -> NSAttributedString {
        if let data = self.data(using: String.Encoding.utf8) {
            do {
                let htmlContent = try NSAttributedString(data: data,
                                                         options: [.documentType:NSAttributedString.DocumentType.html,
                                                                   .characterEncoding:String.Encoding.utf8.rawValue],
                                                         documentAttributes: nil)
                return htmlContent
            }
            catch{}
        }
        return NSAttributedString(string: "")
    }
    
}
