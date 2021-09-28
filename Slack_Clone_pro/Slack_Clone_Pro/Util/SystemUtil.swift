import UIKit

class SystemUtil: NSObject {

    static func getAppDisplayName() -> NSString {
        guard let infoDictionary = Bundle.main.infoDictionary else {
            return ""
        }
        
        return infoDictionary["CFBundleDisplayName"] as! NSString
    }
    
    static func getUUID() -> String {
        return UIDevice.current.identifierForVendor?.uuidString ?? ""
    }    
}
