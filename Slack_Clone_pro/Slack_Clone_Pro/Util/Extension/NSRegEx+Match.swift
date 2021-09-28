import Foundation
import UIKit

extension NSRegularExpression {

    func isMatch(matchee: NSString) -> Bool {
        
        return self.numberOfMatches(in: matchee as String, options: NSRegularExpression.MatchingOptions.init(rawValue: 0), range: NSRange.init(location: 0, length: matchee.length)) > 0 ;
        
    }
}
