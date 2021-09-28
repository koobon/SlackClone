import UIKit
import Contacts

extension CNContact {
    
    var name: String {
        get { return self.familyName + self.givenName }
    }
    
    var phone: String {
        get {
            if let phone = self.phoneNumbers[0].value.value(forKey: "digits") as? String {
                return phone
            }
            return ""
        }
    }
}
