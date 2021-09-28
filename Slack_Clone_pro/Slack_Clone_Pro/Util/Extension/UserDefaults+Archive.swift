import Foundation
import UIKit

extension UserDefaults {

    func setArchive(_ value: Any, forKey: NSString) {        
        let data: NSData = NSKeyedArchiver.archivedData(withRootObject: value) as NSData ;
        self.set(data, forKey: forKey as String)
    }
    
    func objectArchive(_ key: NSString) -> Any? {
        if let data = self.object(forKey: key as String) as? Data {
            return NSKeyedUnarchiver.unarchiveObject(with: data) ;
        }
        return nil
    }
}
