import Foundation
import UIKit

extension NSMutableDictionary {
    
    func setObject(anObject: Any?, forKey: NSString, def: Any) {        
        if let noptObject = anObject {
            self.setObject(noptObject, forKey: forKey as NSCopying)
        } else {
            self.setObject(def, forKey: forKey as NSCopying)
        }
    }
}
