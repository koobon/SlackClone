import Foundation
import UIKit

extension NSRegularExpression {
    
    static func initWithPattern(_ pattern: NSString) -> NSRegularExpression? {
        var result: NSRegularExpression? = nil
        
        do {
            result = try NSRegularExpression.init(pattern: pattern as String, options: NSRegularExpression.Options.init(rawValue: 0))
        }
        catch {
            result = nil
        }
        
        return result
    }
    
    static func rx(_ pattern: NSString) -> NSRegularExpression? {
        return self.initWithPattern(pattern)
    }
    
    static func rx(_ pattern: NSString, ignoreCase: Bool) -> NSRegularExpression? {
        var result: NSRegularExpression? = nil
        do {
            result = try NSRegularExpression.init(pattern: pattern as String, options: ignoreCase ? NSRegularExpression.Options.caseInsensitive : NSRegularExpression.Options.init(rawValue: 0))
        }
        catch {
            result = nil
        }
        
        return result
    }
}
